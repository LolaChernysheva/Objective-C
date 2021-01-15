//
//  FirstViewController.m
//  TableView
//
//  Created by Лолита on 14.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (strong, nonnull) UITableView *tableView;

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //создание объекта табличного представления
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    cell.textLabel.text = @"CellTitle";
    return cell;
}


@end
