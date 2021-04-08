//
//  Hottags.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Hottags.h"


@implementation Hottags

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _tag = [[Tag alloc]initWithDictionary:[dictionary valueForKey:@"tag"]];
        
    }
    return self;
}

@end

