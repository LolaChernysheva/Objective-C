//
//  Visibility.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Visibility.h"

@implementation Visibility

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _ispublic = [dictionary valueForKey:@"ispublic"];
        _isfriend = [dictionary valueForKey:@"isfriend"];
        _isfamily = [dictionary valueForKey:@"isfamily"];
    }
    return self;
}

@end

