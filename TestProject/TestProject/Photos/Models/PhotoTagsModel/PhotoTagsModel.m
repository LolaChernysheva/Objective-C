//
//  PhotoTagsModel.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoTagsModel.h"

@implementation PhotoTagsModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _tags = [dictionary valueForKey:@"tags"];
        
    }
    return self;
}

@end
