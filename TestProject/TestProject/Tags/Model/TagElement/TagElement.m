//
//  TagElement.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "TagElement.h"

@implementation TagElement

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _content = [dictionary valueForKey:@"_content"];
        _thmData = [[ThmData alloc]initWithDictionary:[dictionary valueForKey:@"thm_data"]];
        
    }
    return self;
}


@end


/*
    @"_content": @"content",
    @"thm_data": @"thmData",
 */
