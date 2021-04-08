//
//  FirstVC.m
//  Collection
//
//  Created by Лолита on 07.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *imgURL = @"https://pbs.twimg.com/media/DvYlsRSXcAAMBih.jpg";
    NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:imgURL]];
   // NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 200, 90)];
    myImageView.image = [UIImage imageWithData:data];


   //myImageView.image = [UIImage imageNamed: @"vk"];
    myImageView.contentMode = UIViewContentModeScaleAspectFit;
    myImageView.backgroundColor = [UIColor systemYellowColor];
    [self.view addSubview:myImageView];




}
@end




    // self.view.backgroundColor = [UIColor greenColor];
    //    NSString *imgURL = @"https://www.flickr.com/photos/47574723@N03/31224116391/";
    //    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];


    //    UIImage *image = [[UIImage alloc]initWithData:data];
    //    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    //    imageView.backgroundColor = [UIColor redColor];
    //    [imageView setImage:image];
    //    [self.view addSubview:imageView];
    //    [imageView addSubview:image];

