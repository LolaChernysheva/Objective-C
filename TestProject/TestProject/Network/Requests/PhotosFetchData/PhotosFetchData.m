//
//  PhotosFetchData.m
//  TestProject
//
//  Created by Лолита on 28.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotosFetchData.h"
#import "PhotosVC.h"


#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"

@interface PhotosFetchData() {
    void (^_loadPhotoListResponseCompletionHandler)(PhotoListResponse *someParameter);
}
@end

@implementation PhotosFetchData

- (void) execute: (NSArray <NSURLQueryItem *>*) queryItemsList
                :(void(^)(PhotoListResponse *))handler {
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
       NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
       NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString: API_URL];
       NSURLQueryItem *gueryItemMethod = [[NSURLQueryItem alloc]initWithName:@"method" value:@"flickr.photos.search"];
       NSURLQueryItem *gueryItemFormat = [[NSURLQueryItem alloc]initWithName:@"format" value:@"json"];
       NSURLQueryItem *querryItemNojsoncallback = [[NSURLQueryItem alloc]initWithName:@"nojsoncallback" value:@"1"];
       NSURLQueryItem *querryItemApiKey = [[NSURLQueryItem alloc]initWithName:@"api_key" value: API_KEY];
       
       dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
           NSMutableArray<NSURLQueryItem *> *queryItems = [[NSMutableArray alloc]initWithArray: @[
                  gueryItemMethod,
                  gueryItemFormat,
                  querryItemNojsoncallback,
                  querryItemApiKey
           ]];
   
           [queryItems addObjectsFromArray:queryItemsList];
           urlComponents.queryItems = queryItems;
           
           // Setup the request with URL
           NSURL *url = urlComponents.URL;
           NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
           
           // Convert GET string parameters to data using UTF8 Encoding
           [urlRequest setHTTPMethod:@"GET"];
           
           // Create dataTask
           NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
               
               NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
               PhotoListResponse *photoListResponse = [[PhotoListResponse alloc] initWithDictionary:results];
               // NOTE: copying is very important if you'll call the callback asynchronously,
               // even with garbage collection!
               _loadPhotoListResponseCompletionHandler = [handler copy];
               _loadPhotoListResponseCompletionHandler(photoListResponse);
           }];
           
           // Fire the request
           [dataTask resume];
       });
}

- (void) getPhotoListByTag :(NSString *) tagName
                           :(void(^)(PhotoListResponse *))handler {
    NSURLQueryItem *querryItemTagName = [[NSURLQueryItem alloc]initWithName:@"tags" value: tagName];
    NSArray<NSURLQueryItem *> *queryItems = @[
               querryItemTagName
           ];
    [self execute: queryItems : handler];
}

- (void) getPhotoListBySearch:(NSString *) searchText
                             :(void(^)(PhotoListResponse *))handler {
    NSURLQueryItem *querryItemSearchText = [[NSURLQueryItem alloc]initWithName:@"text" value: searchText];
    NSArray<NSURLQueryItem *> *queryItems = @[
               querryItemSearchText
           ];
     [self execute: queryItems : handler];
}
@end
