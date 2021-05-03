//
//  MostFrequentlyUsedTagsVC.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "MostFrequentlyUsedTagsVC.h"
#import "TagsTableViewCell.h"
#import "PhotosVC.h"
#import "DataManager.h"
#import "Tag.h"
#import "Hottags.h"
#import "Photos.h"
#import "PhotoCellModel.h"
#import "MostFrequentlyTagsFetchData.h"
#import "PhotosFetchData.h"

#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"

@interface MostFrequentlyUsedTagsVC ()

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic) BOOL isSearchBarHidden;
@property (nonatomic, strong) NSLayoutConstraint *tableWithoutSearchBarConstraint;
@property (nonatomic, strong) NSLayoutConstraint *tableWithSearchBarConstraint;

- (void) searchBarButtonTapped : (NSObject *)sender;
- (void) activateTableTopAnchor;

@end

@implementation MostFrequentlyUsedTagsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _isSearchBarHidden = true;
    _searchController = [[UISearchController alloc]initWithSearchResultsController: nil];
    _searchController.searchBar.placeholder = NSLocalizedString(@"search", @"");
    _searchController.searchBar.delegate = self;
    
    self.navigationItem.searchController = self.searchController;
    [_searchController.searchBar setHidden:_isSearchBarHidden];
    
    UIBarButtonItem *searchBarButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem
                                        :UIBarButtonSystemItemSearch target
                                        : self action
                                        : @selector(searchBarButtonTapped:)];
    self.navigationItem.rightBarButtonItem = searchBarButton;
    
    MostFrequentlyTagsFetchData *mostFrequentlyTagsFetchData = [[MostFrequentlyTagsFetchData alloc]init];
    [mostFrequentlyTagsFetchData fetchData:^(Tags * result) {
        self.tagsArray = result.hottags.tag.tagElements;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    
    _tagsArray = [[NSMutableArray<TagElement *> alloc]init];
    UITableView *tagsListTableView = [[UITableView alloc] init];
    tagsListTableView.translatesAutoresizingMaskIntoConstraints = false;
    
    tagsListTableView.dataSource = self;
    tagsListTableView.delegate = self;
    _tableView = tagsListTableView;
    [self.view addSubview:tagsListTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableWithoutSearchBarConstraint = [tagsListTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: -30];
    _tableWithSearchBarConstraint = [tagsListTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor];
    [self activateTableTopAnchor];
    [tagsListTableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    [tagsListTableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [tagsListTableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = true;
}

- (void) activateTableTopAnchor {
    _tableWithoutSearchBarConstraint.active = _isSearchBarHidden;
    _tableWithSearchBarConstraint.active = !_isSearchBarHidden;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _tagsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TagsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TagCell"];
    if(!cell) {
        cell = [[TagsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TagCell"];
    }
    cell.tagLabel.text = _tagsArray[indexPath.row].content;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger indexRow = indexPath.row;
    TagElement *currentTag = [_tagsArray objectAtIndex:indexRow];
    PhotosVC *photosVC = [[PhotosVC alloc] init];
    PhotosFetchData *photosFetchData = [[PhotosFetchData alloc]init];
    [photosFetchData getPhotoListByTag:currentTag.content :^(PhotoListResponse * photoListResponse) {
        [photosVC loadPhotos:photoListResponse];
    }];
    
    [self.navigationController pushViewController: photosVC animated: YES];
}
// MARK: - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (searchBar.text) {
        PhotosVC *photosVC = [[PhotosVC alloc] init];
        PhotosFetchData *photosFetchData = [[PhotosFetchData alloc]init];
        [photosFetchData getPhotoListBySearch: searchBar.text :^(PhotoListResponse * photoListResponse) {
            [photosVC loadPhotos:photoListResponse];
        }];
        
        [self.navigationController pushViewController: photosVC animated: YES];
    }
}

- (void) searchBarButtonTapped : (NSObject *)sender {
    _isSearchBarHidden = !_isSearchBarHidden;
    [_searchController.searchBar setHidden:_isSearchBarHidden];
    [self activateTableTopAnchor];
}
@end

