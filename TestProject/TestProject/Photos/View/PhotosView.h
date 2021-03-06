//
//  PhotosView.h
//  TestProject
//
//  Created by Лолита on 02.05.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotosView : UICollectionView <UICollectionViewDelegateFlowLayout>
- (id)initWith: (UIView *)superView;
@end

NS_ASSUME_NONNULL_END
