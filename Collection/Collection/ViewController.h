//
//  ViewController.h
//  Collection
//
//  Created by Лолита on 27.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@end


