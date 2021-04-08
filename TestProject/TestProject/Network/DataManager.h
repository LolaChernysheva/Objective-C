//
//  DataManager.h
//  TestProject
//
//  Created by Лолита on 04.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photos.h"
#import "Photo.h"
#import "ThmData.h"
#import "TagElement.h"
#import "Hottags.h"
#import "Tags.h"

#define kDataManagerLoadDataDidComplete @"DataManagerLoadDataDidComplete"

typedef enum DataSourceType {
    DataSourceTypeTags,
} DataSourceType;

@interface DataManager : NSObject

+ (instancetype)sharedInstance;


//массив для хранения готовых объектов данных (только чтение)
@property (nonatomic, strong, readonly) NSArray *tags;

@end

