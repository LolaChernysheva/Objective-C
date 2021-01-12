//
//  Country.m
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 11.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Country.h"

@implementation Country

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _currency = [dictionary valueForKey:@"currency"];
        _translations = [dictionary valueForKey:@"name_translations"];
        _name = [dictionary valueForKey:@"name"];
        _code = [dictionary valueForKey:@"code"];
    }
    return self;
}


@end
