//
//  Region.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Region.h"

@implementation Region

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _content = [dictionary valueForKey:@"_content"];
        _woeid = [dictionary valueForKey:@"woeid"];
    }
    return self;
}

@end
