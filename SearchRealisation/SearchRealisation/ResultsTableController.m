//
//  ResultsTableController.m
//  SearchRealisation
//
//  Created by Лолита on 27.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "ResultsTableController.h"

@interface ResultsTableController ()

@end

@implementation ResultsTableController

- (void)update {
    //перезагрузка таблицы с новыми данными
    [self.tableView reloadData];
}

//реализация делегатов tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //количество строк = количесто элементов в массиве results
    return _results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ResultsIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_results objectAtIndex:indexPath.row];
    return cell;
}


@end
