//
//  PhotosVC.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotosVC.h"
#import "DetailPhotoVC.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoResponse.h"
#import "MostFrequentlyUsedTagsVC.h"
#import "PhotoCellModel.h"

@interface PhotosVC ()

@property (nonatomic, strong) UICollectionView *photoCollectionView;
@property (nonatomic, strong) NSMutableArray<SizeElement *> *sizesArray;
@property (nonatomic, strong) NSMutableDictionary <NSString *, UIImage *> *idToPhoto;

@end

@implementation PhotosVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 1.0;
    layout.minimumInteritemSpacing = 1.0;
    layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width/2)-1, ([UIScreen mainScreen].bounds.size.width/2));
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCellIdentifier"];
    _photoCollectionView = _collectionView;
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _photoCellModelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"CollectionViewCellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    PhotoCellModel *photoCellModel = _photoCellModelList[indexPath.row];
    cell.photoImageView.image = photoCellModel.imaage;
    return cell;
}

- (void)collectionView:(UITableView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailPhotoVC *detailPhotoVC = [[DetailPhotoVC alloc] init];
    PhotoCellModel *photoCellModel = _photoCellModelList[indexPath.row];
    NSString *imageUrl = [photoCellModel.sizeElementList lastObject].source;
    [detailPhotoVC loadImage:imageUrl];
    [self.navigationController pushViewController: detailPhotoVC animated: YES];
}

-(void)fetchData {
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString:@"https://www.flickr.com/services/rest/"];
    NSURLQueryItem *gueryItemMethod = [[NSURLQueryItem alloc]initWithName:@"method" value:@"flickr.photos.getSizes"];
    NSURLQueryItem *gueryItemFormat = [[NSURLQueryItem alloc]initWithName:@"format" value:@"json"];
    NSURLQueryItem *querryItemNojsoncallback = [[NSURLQueryItem alloc]initWithName:@"nojsoncallback" value:@"1"];
    NSURLQueryItem *querryItemApiKey = [[NSURLQueryItem alloc]initWithName:@"api_key" value:@"45420ba866f533cd68d2d8efe7b4645e"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        for (NSInteger index = 0; index < self.photoCellModelList.count; index++) {
            
            PhotoCellModel *photoCellModel = self.photoCellModelList[index];
            
            // Set URL Query Items
            NSURLQueryItem *querryItemPhotoId = [[NSURLQueryItem alloc]initWithName:@"photo_id" value:photoCellModel.identifier];

            NSArray<NSURLQueryItem *> *queryItems = @[
                gueryItemMethod,
                gueryItemFormat,
                querryItemNojsoncallback,
                querryItemPhotoId,
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
                PhotoResponse *photoResponse = [[PhotoResponse alloc]initWithDictionary: results];
                NSMutableArray<SizeElement *> *sizesArray = photoResponse.sizes.size;
                
                NSURL *smallImageUrl = [[NSURL alloc] initWithString: sizesArray[3].source];
                NSData *urlImageData = [[NSData alloc]initWithContentsOfURL:smallImageUrl];
                
                UIImage *smallImage = [[UIImage alloc]initWithData:urlImageData];
                NSLog(@"%@", smallImage);
                photoCellModel.imaage = smallImage;
                photoCellModel.sizeElementList = sizesArray;
                self.photoCellModelList[index] = photoCellModel;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.collectionView reloadData];
                });
                
            }];
            
            // Fire the request
            [dataTask resume];
            
        }
    });
}



@end


