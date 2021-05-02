//
//  PhotosLoadImage.m
//  TestProject
//
//  Created by Лолита on 28.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotosLoadImage.h"
#import "PhotosVC.h"
#import "PhotoCellModel.h"


#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"

@interface PhotosLoadImage() {
    void (^_completionHandler)(PhotoResponse *someParameter, PhotoCellModel *model);
    void (^_loadImageCompletionHandler)(UIImage *image);
}

@end

@implementation PhotosLoadImage

//Fraction* arraySum (Fraction *fractPointer, int arraySize)
-(void)loadImages :(NSMutableArray<PhotoCellModel *> *)      photoCellModelList
                  :(void(^)(PhotoResponse *, PhotoCellModel *))handler {
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
       NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
       NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString: API_URL];
       NSURLQueryItem *gueryItemMethod = [[NSURLQueryItem alloc]initWithName:@"method" value:@"flickr.photos.getSizes"];
       NSURLQueryItem *gueryItemFormat = [[NSURLQueryItem alloc]initWithName:@"format" value:@"json"];
       NSURLQueryItem *querryItemNojsoncallback = [[NSURLQueryItem alloc]initWithName:@"nojsoncallback" value:@"1"];
       NSURLQueryItem *querryItemApiKey = [[NSURLQueryItem alloc]initWithName:@"api_key" value: API_KEY];
       
       dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
           //for (NSString *photoId in photoIdList) {
               
           for (NSInteger index = 0; index < photoCellModelList.count; index++) {
               
               PhotoCellModel *photoCellModel = photoCellModelList[index];
               
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
                   // NOTE: copying is very important if you'll call the callback asynchronously,
                   // even with garbage collection!
                   _completionHandler = [handler copy];
                   _completionHandler(photoResponse, photoCellModel);
                   
               }];
               
               // Fire the request
               [dataTask resume];
               
           }
       });
}

-(void) loadImage:(NSString *)imageUrl
                 :(void(^)(UIImage *))handler {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSURL *smallImageUrl = [[NSURL alloc] initWithString: imageUrl];
        NSData *urlImageData = [[NSData alloc]initWithContentsOfURL:smallImageUrl];
        UIImage *bigImage = [[UIImage alloc]initWithData:urlImageData];
        _loadImageCompletionHandler = [handler copy];
        _loadImageCompletionHandler(bigImage);
    
    });
}

@end
