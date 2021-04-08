//
//  PhotoResponse.m
//  TestProject
//
//  Created by Лолита on 07.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoResponse.h"
#import "SizesModel.h"

@implementation PhotoResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _sizes = [[SizesModel alloc]initWithDictionary:[dictionary valueForKey:@"sizes"]];
        _stat = [dictionary valueForKey:@"stat"];
    }
    return self;
}

@end
