//
//  MostFrequentlyTagsFetchData.h
//  TestProject
//
//  Created by Лолита on 28.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tags.h"

NS_ASSUME_NONNULL_BEGIN

@interface MostFrequentlyTagsFetchData : NSObject
-(void)fetchData:(void(^)(Tags *))handler;

@end

NS_ASSUME_NONNULL_END
