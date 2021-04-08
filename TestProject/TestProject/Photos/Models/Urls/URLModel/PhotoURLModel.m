//
//  PhotoURLModel.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoURLModel.h"

@implementation PhotoURLModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
       NSMutableArray<URLPhotoElement *> *urlPhotoElementList = [[NSMutableArray alloc] init];
       
       for (NSDictionary *urlPhotoElementDictionary in dictionary) {
           // Создаем елемент с помощью текущего подсловаря
           URLPhotoElement *urlPhotoElement = [[URLPhotoElement alloc]initWithDictionary: urlPhotoElementDictionary];
           // Добавляем элемент в массив
           [urlPhotoElementList addObject:urlPhotoElement];
       }
       _urlPhotoElements = urlPhotoElementList;
    }
    return self;
}

@end

