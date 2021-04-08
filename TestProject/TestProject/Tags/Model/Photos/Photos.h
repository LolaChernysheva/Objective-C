//
//  Photos.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"


NS_ASSUME_NONNULL_BEGIN

@interface Photos : NSObject

//свойства класса
@property (nonatomic, copy) NSArray<Photo *> *photo;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
