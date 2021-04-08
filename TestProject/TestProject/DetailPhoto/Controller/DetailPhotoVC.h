//
//  DetailPhotoVC.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailPhotoVC : UIViewController

@property (nonatomic, strong) UIImageView *photoView;
-(void) loadImage:(NSString *)imageUrl;
@end

NS_ASSUME_NONNULL_END
