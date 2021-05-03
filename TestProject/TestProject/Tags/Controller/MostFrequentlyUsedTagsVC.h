//
//  MostFrequentlyUsedTagsVC.h
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface MostFrequentlyUsedTagsVC : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (nonatomic, strong, readwrite) NSMutableArray<TagElement *> *tagsArray;
//@property (nonatomic, strong, readwrite) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
