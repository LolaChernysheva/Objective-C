//
//  PhotosLoadImageData.h
//  TestProject
//
//  Created by Лолита on 28.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoResponse.h"
#import "PhotoCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosLoadImage : NSObject

-(void)loadImages :(NSMutableArray<PhotoCellModel *> *)      photoCellModelList
                  :(void(^)(PhotoResponse *, PhotoCellModel *))handler;
-(void) loadImage:(NSString *)imageUrl
                 :(void(^)(UIImage *))handler;

@end

NS_ASSUME_NONNULL_END
