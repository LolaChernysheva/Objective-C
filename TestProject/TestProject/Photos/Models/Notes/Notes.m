//
//  Notes.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Notes.h"

@implementation Notes

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _notes = [dictionary valueForKey: @"notes"];
        
    }
    return self;
}

@end
