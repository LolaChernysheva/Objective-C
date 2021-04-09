//
//  PhotoInfoModel.m
//  TestProject
//
//  Created by Лолита on 09.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoInfoModel.h"

@implementation PhotoInfoModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _page = [dictionary valueForKey:@"page"];
        _pages = [dictionary valueForKey:@"pages"];
        _perpage = [dictionary valueForKey:@"perpage"];
        _total = [dictionary valueForKey:@"total"];
        
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
