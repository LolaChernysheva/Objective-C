//
//  PhotoInfoModel.h
//  TestProject
//
//  Created by Лолита on 09.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoInfoModel : NSObject

@property (nonatomic, copy) NSNumber *page;
@property (nonatomic, copy) NSNumber *pages;
@property (nonatomic, copy) NSNumber *perpage;
@property (nonatomic, copy) NSNumber *total;
@property (nonatomic, copy) NSArray<Photo *> *photo;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
