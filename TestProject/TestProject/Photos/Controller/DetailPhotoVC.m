//
//  DetailPhotoVC.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "DetailPhotoVC.h"

@interface DetailPhotoVC ()

@end

@implementation DetailPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIImageView *photoView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 300, 300)];
    photoView.contentMode = UIViewContentModeScaleAspectFit;
    photoView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:photoView];
}



@end
