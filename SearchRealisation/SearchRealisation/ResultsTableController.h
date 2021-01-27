//
//  ResultsTableController.h
//  SearchRealisation
//
//  Created by Лолита on 27.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ResultsTableController : UITableViewController

//массив с результатами
@property (nonatomic, strong) NSArray *results;
- (void)update;

@end



