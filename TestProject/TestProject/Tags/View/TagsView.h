//
//  TagsView.h
//  TestProject
//
//  Created by Лолита on 03.05.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TagsView : UITableView

@property (nonatomic, strong) UISearchController *searchController;

- (id)initWith: (UIView *)superView;
- (void) searhBarToggle;
- (void) searhBarHide;


@end

NS_ASSUME_NONNULL_END
