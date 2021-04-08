//
//  Hottags.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tag.h"

NS_ASSUME_NONNULL_BEGIN

@interface Hottags : NSObject

//свойства класса
@property (nonatomic, copy) Tag *tag;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
