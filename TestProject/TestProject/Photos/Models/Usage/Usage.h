//
//  Usage.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Usage : NSObject

@property (nonatomic, copy) NSNumber *candownload;
@property (nonatomic, copy) NSNumber *canblog;
@property (nonatomic, copy) NSNumber *canprint;
@property (nonatomic, copy) NSNumber *canshare;

 - (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

