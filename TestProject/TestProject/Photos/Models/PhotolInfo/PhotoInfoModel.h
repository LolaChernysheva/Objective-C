//
//  PhotoInfoModel.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Owner.h"
#import "Title.h"
#import "PhotoDescription.h"
#import "Visibility.h"
#import "Dates.h"
#import "Editability.h"
#import "Publiceditability.h"
#import "Usage.h"
#import "CommentsModel.h"
#import "Notes.h"
#import "People.h"
#import "PhotoTagsModel.h"
#import "Location.h"
#import "Geoperms.h"
#import "Urls.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoInfoModel : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic, copy) NSString *server;
@property (nonatomic, copy) NSNumber *farm;
@property (nonatomic, copy) NSString *dateuploaded;
@property (nonatomic, copy) NSNumber *isfavorite;
@property (nonatomic, copy) NSString *license;
@property (nonatomic, copy) NSString *safetyLevel;
@property (nonatomic, copy) NSNumber *rotation;
@property (nonatomic, strong) Owner *owner;
@property (nonatomic, strong) Title *title;
@property (nonatomic, strong) PhotoDescription *photoDescription;
@property (nonatomic, strong) Visibility *visibility;
@property (nonatomic, strong) Dates *dates;
@property (nonatomic, copy) NSString *views;
@property (nonatomic, strong) Editability *editability;
@property (nonatomic, strong) Publiceditability *publiceditability;
@property (nonatomic, strong) Usage *usage;
@property (nonatomic, strong) CommentsModel *comments;
@property (nonatomic, strong) Notes *notes;
@property (nonatomic, strong) People *people;
@property (nonatomic, strong) PhotoTagsModel *tags;
@property (nonatomic, strong) Location *location;
@property (nonatomic, strong) Geoperms *geoperms;
@property (nonatomic, strong) Urls *urls;
@property (nonatomic, copy) NSString *media;

//кастомный инициализатор
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
