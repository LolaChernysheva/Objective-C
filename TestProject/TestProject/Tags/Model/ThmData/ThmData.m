//
//  ThmData.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "ThmData.h"

@implementation ThmData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _photos = [[Photos alloc]initWithDictionary:[dictionary valueForKey:@"photos"]];
        //_photos = [dictionary valueForKey:@"photos"];
    }
    return self;
}

@end

/*
 @"photos": @"photos"
 */
