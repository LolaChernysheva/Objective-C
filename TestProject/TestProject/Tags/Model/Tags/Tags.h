//
//  Tags.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hottags.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tags : NSObject

//свойства класса
@property (nonatomic, copy)   NSString *period;
@property (nonatomic, copy) NSNumber *count;
@property (nonatomic, strong) Hottags *hottags;
@property (nonatomic, copy)   NSString *stat;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
