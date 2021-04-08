//
//  Tags.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Tags.h"

@implementation Tags

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _period = [dictionary valueForKey:@"period"];
        _count = [dictionary valueForKey:@"count"];
        _hottags = [[Hottags alloc]initWithDictionary:[dictionary valueForKey:@"hottags"]];
        _stat = [dictionary valueForKey:@"stat"];
        
    }
    return self;
}

@end

/*
 @"period": @"period",
 @"count": @"count",
 @"hottags": @"hottags",
 @"stat": @"stat",
 */
