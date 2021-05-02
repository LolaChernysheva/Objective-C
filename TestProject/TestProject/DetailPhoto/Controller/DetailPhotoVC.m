//
//  DetailPhotoVC.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "DetailPhotoVC.h"
#import "PhotosVC.h"
#import "PhotosLoadImage.h"
#import "DetailPhotoView.h"

@interface DetailPhotoVC ()

@property (nonatomic, strong) DetailPhotoView *detailPhotoView;

@end

@implementation DetailPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _detailPhotoView = [[DetailPhotoView alloc]initWith:self.view];
}

-(void) resetImage {
    self.detailPhotoView.photoView.image = nil;
}

-(void) loadImage:(NSString *)imageUrl {
    [self.detailPhotoView.activityIndicator startAnimating];
    PhotosLoadImage *photosLoadImage = [[PhotosLoadImage alloc]init];
    [photosLoadImage loadImage: imageUrl :^(UIImage * image) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
            //self.photoView.image = image;
            self.detailPhotoView.photoView.image = image;
            [self.detailPhotoView.activityIndicator stopAnimating];
        });
    }];
}
@end
