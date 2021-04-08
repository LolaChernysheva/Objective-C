//
//  Owner.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Owner : NSObject

@property (nonatomic, copy) NSString *nsid;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *realname;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *iconserver;
@property (nonatomic, copy) NSNumber *iconfarm;
@property (nonatomic, copy, nullable) NSString *pathAlias;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
