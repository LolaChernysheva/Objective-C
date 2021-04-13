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

#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"

@interface MostFrequentlyUsedTagsVC ()

@property (nonatomic, strong) NSMutableArray<TagElement *> *tagsArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MostFrequentlyUsedTagsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchData];
    _tagsArray = [[NSMutableArray<TagElement *> alloc]init];
    
   // UITableView *tagsListTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
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

-(void)fetchData
{
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // Set URL Query Items
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString: API_URL];
    NSURLQueryItem *gueryItemMethod = [[NSURLQueryItem alloc]initWithName:@"method" value:@"flickr.tags.getHotList"];
    NSURLQueryItem *gueryItemFormat = [[NSURLQueryItem alloc]initWithName:@"format" value:@"json"];
    NSURLQueryItem *querryItemNojsoncallback = [[NSURLQueryItem alloc]initWithName:@"nojsoncallback" value:@"1"];
    NSURLQueryItem *querryItemCount = [[NSURLQueryItem alloc]initWithName:@"count" value:@"10"];
    NSURLQueryItem *querryItemApiKey = [[NSURLQueryItem alloc]initWithName:@"api_key" value: API_KEY];
    
    NSArray<NSURLQueryItem *> *queryItems = @[
        gueryItemMethod,
        gueryItemFormat,
        querryItemNojsoncallback,
        querryItemCount,
        querryItemApiKey
    ];
    urlComponents.queryItems = queryItems;
    
    // Setup the request with URL
    NSURL *url = urlComponents.URL;
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    // Convert GET string parameters to data using UTF8 Encoding
    [urlRequest setHTTPMethod:@"GET"];
    
    // Create dataTask
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        Tags *tags = [[Tags alloc]initWithDictionary: results];
        self.tagsArray = tags.hottags.tag.tagElements;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    
    // Fire the request
    [dataTask resume];
}




@end


