//
//  PhotosVC.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCellModel.h"
#import "PhotoListResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSString *tagName;

- (void)loadPhotos :(PhotoListResponse *) result;

@end

NS_ASSUME_NONNULL_END
