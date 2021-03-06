//
//  MainViewController.m
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 12.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "MainViewController.h"
#import "DataManager.h"
#import "FirstViewController.h"
#import "PlaceViewController.h"
#import "APIManager.h"
#import "Ticket.h"
#import "TicketsViewController.h"

@interface MainViewController () <PlaceViewControllerDelegate>

@property (nonatomic, strong) UIView *placeContainerView;
@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic) SearchRequest searchRequest;
@property (nonatomic, strong) UIButton *searchButton;

@end

@implementation MainViewController

- (void) changeViewColor {
    FirstViewController *firstController = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstController animated:YES];
    self.view.backgroundColor = [UIColor darkGrayColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [[DataManager sharedInstance] loadData];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.title = @"Поиск";
    
    //объявляем контейнер для формы поиска
    _placeContainerView = [[UIView alloc] initWithFrame:CGRectMake(20.0, 140.0, [UIScreen mainScreen].bounds.size.width - 40.0, 170.0)];
    _placeContainerView.backgroundColor = [UIColor whiteColor];
    _placeContainerView.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:0.1] CGColor];
    _placeContainerView.layer.shadowOffset = CGSizeZero;
    _placeContainerView.layer.shadowRadius = 20.0;
    _placeContainerView.layer.shadowOpacity = 1.0;
    _placeContainerView.layer.cornerRadius = 6.0;
    
    //создание компонента "Откуда" и добавление его на контейнер
    _departureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_departureButton setTitle:@"Откуда" forState: UIControlStateNormal];
    _departureButton.tintColor = [UIColor blackColor];
    _departureButton.frame = CGRectMake(10.0, 20.0, _placeContainerView.frame.size.width - 20.0, 60.0);
    _departureButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    _departureButton.layer.cornerRadius = 4.0;
    [_departureButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.placeContainerView addSubview:_departureButton];
    
    //создание компонента "Куда" и добавление его на контейнер
    _arrivalButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_arrivalButton setTitle:@"Куда" forState: UIControlStateNormal];
    _arrivalButton.tintColor = [UIColor blackColor];
    _arrivalButton.frame = CGRectMake(10.0, CGRectGetMaxY(_departureButton.frame) + 10.0, _placeContainerView.frame.size.width - 20.0, 60.0);
    _arrivalButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    _arrivalButton.layer.cornerRadius = 4.0;
    [_arrivalButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.placeContainerView addSubview:_arrivalButton];
    
    [self.view addSubview:_placeContainerView];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_searchButton setTitle:@"Найти" forState:UIControlStateNormal];
    _searchButton.tintColor = [UIColor whiteColor];
    _searchButton.frame = CGRectMake(30.0, CGRectGetMaxY(_placeContainerView.frame) + 30, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    _searchButton.backgroundColor = [UIColor blackColor];
    _searchButton.layer.cornerRadius = 8.0;
    _searchButton.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
    [_searchButton addTarget:self action:@selector(searchButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
    
    //подписали класс на события, которые хранятся в константе kDataManagerLoadDataDidComplete
    //уведомления от ДатаМенеджер, который сообщит о полнй загрузке данных JSON
    //при получении такого уведомления будет вызываться метод cityForCurrentIP
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataLoadedSuccessfully) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)searchButtonDidTap:(UIButton *)sender {
    [[APIManager sharedInstance] ticketsWithRequest:_searchRequest withCompletion:^(NSArray *tickets) {
        if (tickets.count > 0) {
        TicketsViewController *ticketsViewController = [[TicketsViewController alloc] initWithTickets:tickets];
        [self.navigationController showViewController:ticketsViewController sender:self];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Увы!" message:@"По данному направлению билетов не найдено" preferredStyle: UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Закрыть" style:(UIAlertActionStyleDefault) handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        }
    }];
}


- (void)dataLoadedSuccessfully {
    [[APIManager sharedInstance] cityForCurrentIP:^(City *city) {
    [self setPlace:city withDataType:DataSourceTypeCity andPlaceType:PlaceTypeDeparture forButton:_departureButton];
    }];
}


- (void)placeButtonDidTap:(UIButton *)sender {
    PlaceViewController *placeViewController;
    if ([sender isEqual:_departureButton]) {
        placeViewController = [[PlaceViewController alloc] initWithType: PlaceTypeDeparture];
    } else {
        placeViewController = [[PlaceViewController alloc] initWithType: PlaceTypeArrival];
    }
    placeViewController.delegate = self;
    [self.navigationController pushViewController: placeViewController animated:YES];
}

- (void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType {
    [self setPlace:place withDataType:dataType andPlaceType:placeType forButton: (placeType == PlaceTypeDeparture) ? _departureButton : _arrivalButton ];
}

- (void)setPlace:(id)place withDataType:(DataSourceType)dataType andPlaceType:(PlaceType)placeType forButton:(UIButton *)button {
    NSString *title;
    NSString *iata;
    if (dataType == DataSourceTypeCity) {
        City *city = (City *)place;
        title = city.name;
        iata = city.code;
    } else if (dataType == DataSourceTypeAirport) {
        Airport *airport = (Airport *)place;
        title = airport.name;
        iata = airport.cityCode;
    }
    if (placeType == PlaceTypeDeparture) {
        _searchRequest.origin = iata;
    } else {
        _searchRequest.destionation = iata;
    }
    [button setTitle: title forState: UIControlStateNormal];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)loadDataComplete {
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    /*
    UIButton *myButton = [[UIButton alloc] initWithFrame: CGRectMake(5, 100, 190, 20)];
    [myButton setTitle:@"Press me" forState:UIControlStateNormal];
    myButton.backgroundColor = [UIColor blueColor];
    myButton.tintColor = [UIColor grayColor];
    [myButton addTarget:self action:@selector(changeViewColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: myButton];
     */
}
    




@end
