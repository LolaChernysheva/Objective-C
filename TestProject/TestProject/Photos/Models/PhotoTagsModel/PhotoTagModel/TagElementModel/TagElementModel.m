//
//  TagElementModel.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "TagElementModel.h"

@implementation TagElementModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _identifier = [dictionary valueForKey:@"id"];
        _author = [dictionary valueForKey:@"author"];
        _authorname = [dictionary valueForKey:@"authorname"];
        _raw = [dictionary valueForKey:@"raw"];
        _contant = [dictionary valueForKey:@"_content"];
        _machineTag = [dictionary valueForKey:@"machine_tag"];
    }
    return self;
}

@end
