//
//  PhotoListResponse.h
//  TestProject
//
//  Created by Лолита on 09.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoListResponse : NSObject

@property (nonatomic, strong) PhotoInfoModel *photos;
@property (nonatomic, copy) NSString *stat;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
