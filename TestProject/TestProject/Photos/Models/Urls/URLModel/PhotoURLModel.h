//
//  PhotoURLModel.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLPhotoElement.h"


NS_ASSUME_NONNULL_BEGIN

@interface PhotoURLModel : NSObject

@property (nonatomic, copy) NSMutableArray<URLPhotoElement *> *urlPhotoElements;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
