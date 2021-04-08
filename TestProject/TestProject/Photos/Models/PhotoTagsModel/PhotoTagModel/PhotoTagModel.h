//
//  PhotoTagModel.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TagElementModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoTagModel : NSObject
//свойства класса
@property (nonatomic, copy) NSMutableArray<TagElementModel *> *tagElements;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
