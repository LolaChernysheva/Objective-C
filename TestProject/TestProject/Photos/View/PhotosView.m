//
//  PhotosView.m
//  TestProject
//
//  Created by Лолита on 02.05.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotosView.h"
#import "PhotoCollectionViewCell.h"

@interface PhotosView ()
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;


@end

@implementation PhotosView

- (id) initWith: (UIView *)superView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 1.0;
    layout.minimumInteritemSpacing = 1.0;
    layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width/2)-1, ([UIScreen mainScreen].bounds.size.width/2));
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self = [super initWithFrame:self.bounds collectionViewLayout:layout];
    self.backgroundColor = [UIColor whiteColor];
    [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCellIdentifier"];
    self.translatesAutoresizingMaskIntoConstraints = false;
    [superView addSubview:self];
    [self.topAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.topAnchor].active = true;
    [self.leadingAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.leadingAnchor].active = true;
    [self.trailingAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.trailingAnchor].active = true;
    [self.bottomAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.bottomAnchor].active = true;
    return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemsPerRow = 2;
    CGFloat paddingWidth = 20 * (itemsPerRow + 1);
    CGFloat availableWidth = collectionView.frame.size.width - paddingWidth;
    CGFloat widthPerItem = availableWidth / itemsPerRow;
    return CGSizeMake(widthPerItem, widthPerItem);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}


@end
