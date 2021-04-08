//
//  Tag.h
//  TestProject
//
//  Created by Лолита on 04.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TagElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tag : NSObject

//свойства класса
@property (nonatomic, copy) NSMutableArray<TagElement *> *tagElements;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
