//
//  TagsView.m
//  TestProject
//
//  Created by Лолита on 03.05.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "TagsView.h"
@interface TagsView ()

@property (nonatomic, strong) NSLayoutConstraint *tableWithoutSearchBarConstraint;
@property (nonatomic, strong) NSLayoutConstraint *tableWithSearchBarConstraint;
@property (nonatomic) BOOL isSearchBarHidden;

@end;

@implementation TagsView


- (id)initWith: (UIView *)superView {
    self = [super initWithFrame:superView.frame];
    
    _isSearchBarHidden = true;
    
    _searchController = [[UISearchController alloc]initWithSearchResultsController: nil];
    _searchController.searchBar.placeholder = NSLocalizedString(@"search", @"");
    _searchController.active = false;
    self.tableHeaderView = nil;
    
    self.translatesAutoresizingMaskIntoConstraints = false;

    [superView addSubview:self];
    superView.backgroundColor = [UIColor whiteColor];
    
    [self.topAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.topAnchor].active = true;
    [self.leadingAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.leadingAnchor].active = true;
    [self.trailingAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.trailingAnchor].active = true;
    [self.bottomAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.bottomAnchor].active = true;
    
    return self;
}

- (void) searhBarToggle {
    _isSearchBarHidden = !_isSearchBarHidden;
    _searchController.active = !_isSearchBarHidden;
    self.tableHeaderView = _isSearchBarHidden ? nil : self.searchController.searchBar;
}

- (void) searhBarHide {
    _isSearchBarHidden = true;
    _searchController.active = false;
    self.tableHeaderView = nil;
}

@end
