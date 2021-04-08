//
//  PhotosVC.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
//@property (nonatomic, strong) NSMutableArray<NSString *> *identifierArray;
@property (nonatomic, strong) NSMutableArray<PhotoCellModel *> *photoCellModelList;
@end

NS_ASSUME_NONNULL_END
