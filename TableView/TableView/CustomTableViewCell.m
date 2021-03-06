//
//  CustomTableViewCell.m
//  TableView
//
//  Created by Лолита on 15.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width/2.0, 44.0)];
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_leftLabel];
        
        _rightLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0, 0.0, [UIScreen mainScreen].bounds.size.width/2.0, 44.0)];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_rightLabel];
    }
    return self;
}






- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
