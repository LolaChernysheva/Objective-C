//
//  Urls.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoURLModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Urls : NSObject

@property (nonatomic, strong) PhotoURLModel *urlModel;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
