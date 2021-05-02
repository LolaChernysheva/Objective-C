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
        _photoImageView = [[UIImageView alloc]init];
        _photoImageView.translatesAutoresizingMaskIntoConstraints = false;
        _photoImageView.backgroundColor = [UIColor lightGrayColor];
        _photoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_photoImageView];
        [_photoImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = true;
        [_photoImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = true;
        [_photoImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = true;
        [_photoImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = true;
        _photoImageView.backgroundColor = [UIColor lightGrayColor];
        _photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
    
}
@end
