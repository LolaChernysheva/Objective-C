//
//  Editability.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Editability.h"

@implementation Editability

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _cancomment = [dictionary valueForKey:@"cancomment"];
        _canaddmeta = [dictionary valueForKey:@"canaddmeta"];
    }
    return self;
}

@end

