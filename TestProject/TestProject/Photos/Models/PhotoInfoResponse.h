//
//  PhotoInfoResponse.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoInfoResponse : NSObject

//свойства класса
@property (nonatomic, strong) PhotoInfoModel *photo;
@property (nonatomic, copy) NSString *stat;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


NS_ASSUME_NONNULL_END



