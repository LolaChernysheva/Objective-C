//
//  DetailPhotoView.m
//  TestProject
//
//  Created by Лолита on 02.05.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "DetailPhotoView.h"

@implementation DetailPhotoView

-(id) initWith: (UIView *)superView {
    self = [super initWithFrame:superView.frame];
    self.backgroundColor = [UIColor whiteColor];
    
    self.translatesAutoresizingMaskIntoConstraints = false;
       [superView addSubview: self];
       [self.topAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.topAnchor].active = true;
       [self.leadingAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.leadingAnchor].active = true;
       [self.trailingAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.trailingAnchor].active = true;
       [self.bottomAnchor constraintEqualToAnchor:superView.safeAreaLayoutGuide.bottomAnchor].active = true;
    
    _photoView = [[UIImageView alloc]initWithFrame: self.frame];
    _photoView.contentMode = UIViewContentModeScaleAspectFit;
    _photoView.backgroundColor = [UIColor whiteColor];
    
    _activityIndicator = [[UIActivityIndicatorView alloc]init];
    _activityIndicator.color = [UIColor blackColor];
    
    _photoView.translatesAutoresizingMaskIntoConstraints = false;
    _activityIndicator.translatesAutoresizingMaskIntoConstraints = false;
    
    [self addSubview:_photoView];
    [self addSubview:_activityIndicator];
    
    [_photoView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = true;
    [_photoView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor].active = true;
    [_photoView.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor].active = true;
    [_photoView.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor].active = true;
    [_activityIndicator.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
      [_activityIndicator.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = true;
    return self;
}

@end
