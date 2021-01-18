//
//  APIManager.h
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 18.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"




@interface APIManager : NSObject

+ (instancetype)sharedInstance;
- (void)cityForCurrentIP:(void (^)(City *city))completion;

@end


