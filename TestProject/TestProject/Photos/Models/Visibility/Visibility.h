//
//  Visibility.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Visibility : NSObject

@property (nonatomic, copy) NSNumber *ispublic;
@property (nonatomic, copy) NSNumber *isfriend;
@property (nonatomic, copy) NSNumber *isfamily;

 - (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

