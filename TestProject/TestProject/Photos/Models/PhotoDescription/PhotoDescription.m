//
//  PhotoDescription.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoDescription.h"

@implementation PhotoDescription

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _content = [dictionary valueForKey:@"_content"];
    }
    return self;
}

@end
