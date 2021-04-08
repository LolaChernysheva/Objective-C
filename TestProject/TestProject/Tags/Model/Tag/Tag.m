//
//  Tag.m
//  TestProject
//
//  Created by Лолита on 04.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Tag.h"

@implementation Tag
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        NSMutableArray<TagElement *> *tagElementList = [[NSMutableArray alloc] init];
        
        for (NSDictionary *tagElementDictionary in dictionary) {
            // Создаем елемент с помощью текущего подсловаря
            TagElement *tagElement = [[TagElement alloc]initWithDictionary: tagElementDictionary];
            // Добавляем элемент в массив
            [tagElementList addObject:tagElement];
        }
        _tagElements = tagElementList;
        
    }
    return self;
}
@end
