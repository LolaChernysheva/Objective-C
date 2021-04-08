//
//  TagElement.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThmData.h"

NS_ASSUME_NONNULL_BEGIN

@interface TagElement : NSObject

//свойства класса
@property (nonatomic, copy)   NSString *content;
@property (nonatomic, strong) ThmData *thmData;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
