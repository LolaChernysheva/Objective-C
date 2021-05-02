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

@interface DetailPhotoVC ()

@end

@implementation DetailPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _photoView = [[UIImageView alloc]initWithFrame: self.view.frame];
    _photoView.contentMode = UIViewContentModeScaleAspectFit;
    _photoView.backgroundColor = [UIColor whiteColor];
    _activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:self.view.frame];
    _activityIndicator.color = [UIColor blackColor];
    [_activityIndicator startAnimating];
    _photoView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:_photoView];
    [self.view addSubview:_activityIndicator];
    [_photoView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = true;
    [_photoView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    [_photoView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [_photoView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = true;
}

-(void) loadImage:(NSString *)imageUrl {
    PhotosLoadImage *photosLoadImage = [[PhotosLoadImage alloc]init];
    [photosLoadImage loadImage: imageUrl :^(UIImage * image) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
            _photoView.image = image;
            [_activityIndicator stopAnimating];
        });
    }];
    
}
@end
