//
//  MostFrequentlyTagsFetchData.m
//  TestProject
//
//  Created by Лолита on 28.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "MostFrequentlyTagsFetchData.h"
#import "MostFrequentlyUsedTagsVC.h"
#import "Tag.h"
#import "Hottags.h"
#import "DataManager.h"

#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"

@interface MostFrequentlyTagsFetchData() {
    void (^_loadTagsCompletionHandler)(Tags *someParameter);
}
@end

@implementation MostFrequentlyTagsFetchData
-(void)fetchData:(void(^)(Tags *))handler {
    
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
        // NOTE: copying is very important if you'll call the callback asynchronously,
        // even with garbage collection!
        _loadTagsCompletionHandler = [handler copy];
        _loadTagsCompletionHandler(tags);
    }];
    
    // Fire the request
    [dataTask resume];
}


@end
