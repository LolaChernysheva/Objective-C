//
//  Photos.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Photos.h"

@implementation Photos

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSMutableArray<Photo *> *photoList = [[NSMutableArray alloc] init];
        
        for (NSDictionary *photoDictionary in [dictionary valueForKey:@"photo"]) {
            // Создаем елемент с помощью текущего подсловаря
            Photo *photo = [[Photo alloc] initWithDictionary:photoDictionary];
            // Добавляем элемент в массив
            [photoList addObject:photo];
        }
        _photo = photoList;
    }
    return self;
}

@end


/*
    @"photo": @"photo",
 */
