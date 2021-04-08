//
//  DetailPhotoVC.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "DetailPhotoVC.h"
#import "PhotosVC.h"

@interface DetailPhotoVC ()

@end

@implementation DetailPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _photoView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 300, 300)];
    _photoView.contentMode = UIViewContentModeScaleAspectFit;
    _photoView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:_photoView];
}

-(void) loadImage:(NSString *)imageUrl {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSURL *smallImageUrl = [[NSURL alloc] initWithString: imageUrl];
        NSData *urlImageData = [[NSData alloc]initWithContentsOfURL:smallImageUrl];
        
        UIImage *bigImage = [[UIImage alloc]initWithData:urlImageData];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
            _photoView.image = bigImage;
        });
    });
}



@end
