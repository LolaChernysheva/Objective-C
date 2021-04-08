//
//  PhotoCollectionViewCell.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor systemBlueColor];
        _photoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.origin.x,
                                                                                    self.contentView.frame.origin.y,
                                                                                    self.frame.size.width,
                                                                                    self.frame.size.height)];
        _photoImageView.backgroundColor = [UIColor whiteColor];
        _photoImageView.translatesAutoresizingMaskIntoConstraints = false;
        
//       NSString *imgURL = @"https://pbs.twimg.com/media/DvYlsRSXcAAMBih.jpg";
//       NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:imgURL]];
       
       //photoImageView.image = [UIImage imageWithData:data];
       // photoImageView.image = [UIImage imageNamed:@"vk"];
       _photoImageView.contentMode = UIViewContentModeScaleAspectFit;
      [self addSubview:_photoImageView];

    }
    return self;

}



@end
