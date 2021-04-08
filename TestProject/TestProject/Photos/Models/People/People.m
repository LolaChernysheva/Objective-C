//
//  People.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "People.h"

@implementation People

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _haspeople = [dictionary valueForKey:@"haspeople"];        
    }
    return self;
}

@end
