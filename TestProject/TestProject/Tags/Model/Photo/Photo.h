//
//  Photo.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

//свойства класса
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic, copy) NSString *server;
@property (nonatomic, copy) NSNumber *farm;
@property (nonatomic, copy) NSString *owner;
@property (nonatomic, nullable, copy) id username;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *ispublic;
@property (nonatomic, copy) NSNumber *isfriend;
@property (nonatomic, copy) NSNumber *isfamily;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
