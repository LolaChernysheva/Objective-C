//
//  PhotoInfoResponse.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoInfoResponse.h"

@implementation PhotoInfoResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _photo = [[PhotoInfoModel alloc]initWithDictionary:[dictionary valueForKey:@"photo"]];
        _stat = [dictionary valueForKey:@"stat"];
    }
    return self;
}
@end
