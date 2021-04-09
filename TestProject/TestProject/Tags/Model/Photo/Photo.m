//
//  Photo.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _identifier = [dictionary valueForKey:@"id"];
         _secret = [dictionary valueForKey:@"secret"];
         _server = [dictionary valueForKey:@"server"];
         _farm = [dictionary valueForKey:@"farm"];
         _owner = [dictionary valueForKey:@"owner"];
        _username = [dictionary valueForKey:@"username"];
        _title = [dictionary valueForKey:@"title"];
        _ispublic = [dictionary valueForKey:@"ispublic"];
        _isfriend = [dictionary valueForKey:@"isfriend"];
        _isfamily = [dictionary valueForKey:@"isfamily"];
    }
    return self;
}

@end

