//
//  DataManager.m
//  TestProject
//
//  Created by Лолита on 04.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "DataManager.h"
#import "Photos.h"
#import "Photo.h"
#import "ThmData.h"
#import "TagElement.h"
#import "Hottags.h"
#import "Tags.h"
#import <UIKit/UIKit.h>


@interface DataManager()

@property(nonatomic, strong) NSMutableArray *tagsArray;

@end

@implementation DataManager

//для возможности использования без создания экземпляра
+ (instancetype)sharedInstance
{
    static DataManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataManager alloc] init];
    });
    return instance;
}
@end
