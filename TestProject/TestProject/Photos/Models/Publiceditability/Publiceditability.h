//
//  Publiceditability.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Publiceditability : NSObject

@property (nonatomic, copy) NSNumber *cancomment;
@property (nonatomic, copy) NSNumber *canaddmeta;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
