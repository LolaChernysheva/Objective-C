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
#import "TagsView.h"

#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"

@interface MostFrequentlyUsedTagsVC ()

@property (nonatomic, strong) TagsView *tagsView;

- (void) searchBarButtonTapped : (NSObject *)sender;
- (void) loadData;

@end

@implementation MostFrequentlyUsedTagsVC

// MARK: - Live cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tagsView = [[TagsView alloc]initWith:self.view];
    _tagsView.searchController.searchBar.delegate = self;
    _tagsView.dataSource = self;
    _tagsView.delegate = self;
    
    UIBarButtonItem *searchBarButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem
                                        :UIBarButtonSystemItemSearch target
                                        : self action
                                        : @selector(searchBarButtonTapped:)];
    self.navigationItem.rightBarButtonItem = searchBarButton;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
}

// MARK: - Network

- (void) loadData {
    MostFrequentlyTagsFetchData *mostFrequentlyTagsFetchData = [[MostFrequentlyTagsFetchData alloc]init];
    [mostFrequentlyTagsFetchData fetchData:^(Tags * result) {
        self.tagsArray = result.hottags.tag.tagElements;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tagsView reloadData];
        });
        
    }];
    _tagsArray = [[NSMutableArray<TagElement *> alloc]init];
}

// MARK: - Table view data source & delegate

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
    
    [self.navigationController pushViewController: photosVC animated: true];
    
    [self.tagsView deselectRowAtIndexPath:indexPath animated: false];
}

// MARK: - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (searchBar.text) {
        PhotosVC *photosVC = [[PhotosVC alloc] init];
        PhotosFetchData *photosFetchData = [[PhotosFetchData alloc]init];
        [photosFetchData getPhotoListBySearch: searchBar.text :^(PhotoListResponse * photoListResponse) {
            [photosVC loadPhotos:photoListResponse];
        }];
        
        [_tagsView searhBarHide];
        
        [self.navigationController pushViewController: photosVC animated: true];
    }
}

// MARK: - Actions

- (void) searchBarButtonTapped : (NSObject *)sender {
    [_tagsView searhBarToggle];
}
@end

