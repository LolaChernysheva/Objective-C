//
//  Note.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Note.h"

@implementation Note

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        //с сервера приходит пустой массив, непонятно, как парсить
        _noteElements = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
