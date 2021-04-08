//
//  Urls.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Urls.h"

@implementation Urls

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _urlModel = [[PhotoURLModel alloc]initWithDictionary:[dictionary valueForKey:@"url"]];
    }
    return self;
}

@end
