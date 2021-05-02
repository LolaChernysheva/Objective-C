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

#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"


@implementation MostFrequentlyUsedTagsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    [tagsListTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = true;
    [tagsListTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = true;
    [tagsListTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = true;
    [tagsListTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;
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
    photosVC.tagName = currentTag.content;
    
    [self.navigationController pushViewController: photosVC animated: YES];
}
@end

