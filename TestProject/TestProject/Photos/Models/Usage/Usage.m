//
//  Usage.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Usage.h"

@implementation Usage

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _candownload = [dictionary valueForKey:@"candownload"];
        _canblog = [dictionary valueForKey:@"canblog"];
        _canprint = [dictionary valueForKey:@"canprint"];
        _canshare = [dictionary valueForKey:@"canshare"];
    }
    return self;
}

@end
