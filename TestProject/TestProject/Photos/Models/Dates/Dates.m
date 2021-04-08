//
//  Dates.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Dates.h"

@implementation Dates

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _posted = [dictionary valueForKey:@"posted"];
        _taken = [dictionary valueForKey:@"taken"];
        _takengranularity = [dictionary valueForKey:@"takengranularity"];
        _takenunknown = [dictionary valueForKey:@"takenunknown"];
        _lastupdate = [dictionary valueForKey:@"lastupdate"];
    }
    return self;
}

@end
