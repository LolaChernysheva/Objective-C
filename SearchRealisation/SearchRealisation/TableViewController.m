//
//  TableViewController.m
//  SearchRealisation
//
//  Created by Лолита on 27.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "TableViewController.h"
#import "ResultsTableController.h"

@interface TableViewController ()

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) ResultsTableController *resultsController;
@property (nonatomic, strong) NSArray *array;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"Белый", @"Зеленый", @"Красный", @"Черный", @"Серый", @"Синий"];
    
    _resultsController = [[ResultsTableController alloc] init];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultsController];
    _searchController.searchResultsUpdater = self;
    self.tableView.tableHeaderView = _searchController.searchBar;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchBar.text) {
        _resultsController.results = [self.array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchController.searchBar.text]];
        [_resultsController update];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}


@end
