//
//  SizeElement.m
//  TestProject
//
//  Created by Лолита on 07.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "SizeElement.h"

@implementation SizeElement

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _label = [dictionary valueForKey:@"label"];
        _width = [dictionary valueForKey:@"width"];
        _height = [dictionary valueForKey:@"height"];
        _source = [dictionary valueForKey:@"source"];
        _url = [dictionary valueForKey:@"url"];
        _media = [dictionary valueForKey:@"media"];
    }
    return self;
}

@end
