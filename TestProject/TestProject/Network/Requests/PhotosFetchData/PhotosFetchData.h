//
//  PhotosFetchData.h
//  TestProject
//
//  Created by Лолита on 28.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoListResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosFetchData : NSObject

-(void)fetchData :(NSString *)tagName
                 :(void(^)(PhotoListResponse *))handler;

@end


NS_ASSUME_NONNULL_END





