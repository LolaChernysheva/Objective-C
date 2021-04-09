//
//  PhotoListResponse.m
//  TestProject
//
//  Created by Лолита on 09.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoListResponse.h"

@implementation PhotoListResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _photos = [[PhotoInfoModel alloc]initWithDictionary:[dictionary valueForKey:@"photos"]];
        _stat = [dictionary valueForKey:@"stat"];
    }
    return self;
}

@end
