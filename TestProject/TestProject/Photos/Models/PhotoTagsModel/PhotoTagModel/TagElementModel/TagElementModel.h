//
//  TagElementModel.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TagElementModel : NSObject

//свойства класса
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *authorname;
@property (nonatomic, copy) NSString *raw;
@property (nonatomic, copy) NSString *contant;
@property (nonatomic, copy) NSNumber *machineTag;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;




@end

NS_ASSUME_NONNULL_END
