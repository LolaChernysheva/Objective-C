//
//  SizeElement.h
//  TestProject
//
//  Created by Лолита on 07.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SizeElement : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSNumber *width;
@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *media;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END



