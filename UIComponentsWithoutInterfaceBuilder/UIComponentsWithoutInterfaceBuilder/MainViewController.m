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

@interface MainViewController ()

@end

@implementation MainViewController

- (void) changeViewColor
{
    FirstViewController *firstController = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstController animated:YES];
    
   // self.view.backgroundColor = [UIColor darkGrayColor] ? [UIColor darkGrayColor] : [UIColor greenColor];
    self.view.backgroundColor = [UIColor darkGrayColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DataManager sharedInstance] loadData];

    self.view.backgroundColor = [UIColor whiteColor];
       
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataComplete) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)loadDataComplete
{
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    
    UIButton *myButton = [[UIButton alloc] initWithFrame: CGRectMake(5, 50, 190, 20)];
    [myButton setTitle:@"Press me" forState:UIControlStateNormal];
    myButton.backgroundColor = [UIColor blueColor];
    myButton.tintColor = [UIColor grayColor];
    [myButton addTarget:self action:@selector(changeViewColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: myButton];
    
 
}
    




@end
