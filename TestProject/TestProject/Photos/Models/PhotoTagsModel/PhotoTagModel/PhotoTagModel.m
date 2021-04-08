//
//  PhotoTagModel.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoTagModel.h"

@implementation PhotoTagModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        NSMutableArray<TagElementModel *> *tagElementList = [[NSMutableArray alloc] init];
        
        for (NSDictionary *tagElementDictionary in dictionary) {
            // Создаем елемент с помощью текущего подсловаря
            TagElementModel *tagElement = [[TagElementModel alloc]initWithDictionary: tagElementDictionary];
            // Добавляем элемент в массив
            [tagElementList addObject:tagElement];
        }
        _tagElements = tagElementList;
    }
    return self;
}

@end
