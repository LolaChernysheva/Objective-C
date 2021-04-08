//
//  PhotoCellModel.h
//  TestProject
//
//  Created by Лолита on 08.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SizesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCellModel : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy, nullable) UIImage *imaage;
@property (nonatomic, strong, nullable) NSMutableArray <SizeElement *> *sizeElementList;

@end

NS_ASSUME_NONNULL_END
