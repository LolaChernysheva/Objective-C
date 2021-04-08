//
//  Dates.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dates : NSObject

@property (nonatomic, copy) NSString *posted;
@property (nonatomic, copy) NSString *taken;
@property (nonatomic, copy) NSString *takengranularity;
@property (nonatomic, copy) NSString *takenunknown;
@property (nonatomic, copy) NSString *lastupdate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
