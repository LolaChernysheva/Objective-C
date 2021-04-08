//
//  SizesModel.m
//  TestProject
//
//  Created by Лолита on 07.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "SizesModel.h"

@implementation SizesModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _canblog = [dictionary valueForKey:@"canblog"];
        _canprint = [dictionary valueForKey:@"canprint"];
        _candownload = [dictionary valueForKey:@"candownload"];
        NSMutableArray<SizeElement *> *sizeElements = [[NSMutableArray alloc] init];
        
        for (NSDictionary *sizeElementDictionary in [dictionary valueForKey:@"size"]) {
            // Создаем елемент с помощью текущего подсловаря
            SizeElement *sizeElement = [[SizeElement alloc]initWithDictionary:sizeElementDictionary];
            // Добавляем элемент в массив
            [sizeElements addObject:sizeElement];
        }
        _size = sizeElements;
    }
    return self;
}
@end
