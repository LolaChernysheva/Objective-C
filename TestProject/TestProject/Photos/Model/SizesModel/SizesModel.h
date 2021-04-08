//
//  SizesModel.h
//  TestProject
//
//  Created by Лолита on 07.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SizeElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface SizesModel : NSObject

@property (nonatomic, copy) NSNumber *canblog;
@property (nonatomic, copy) NSNumber *canprint;
@property (nonatomic, copy) NSNumber *candownload;
//@property (nonatomic, strong) SizeModel *size;
@property (nonatomic, strong) NSMutableArray<SizeElement *> *size;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END


