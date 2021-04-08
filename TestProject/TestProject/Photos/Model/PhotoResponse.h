//
//  PhotoResponse.h
//  TestProject
//
//  Created by Лолита on 07.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SizesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoResponse : NSObject

@property (nonatomic, strong) SizesModel *sizes;
@property (nonatomic, copy) NSString *stat;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
