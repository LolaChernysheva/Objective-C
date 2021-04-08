//
//  Location.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Location.h"

@implementation Location

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _latitude = [dictionary valueForKey:@"latitude"];
        _longitude = [dictionary valueForKey:@"longitude"];
        _accuracy = [dictionary valueForKey:@"accuracy"];
        _context = [dictionary valueForKey:@"context"];
        _locality = [[Locality alloc] initWithDictionary:[dictionary valueForKey:@"locality"]];
        _county = [[County alloc] initWithDictionary:[dictionary valueForKey:@"county"]];
        _region = [[Region alloc] initWithDictionary:[dictionary valueForKey:@"region"]];
        _country = [[Country alloc] initWithDictionary:[dictionary valueForKey:@"country"]];
        _neighbourhood = [[Neighbourhood alloc] initWithDictionary:[dictionary valueForKey:@"neighbourhood"]];
    }
    return self;
}
@end


