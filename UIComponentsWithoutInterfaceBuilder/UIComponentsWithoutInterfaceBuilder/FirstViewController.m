//
//  FirstViewController.m
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 25.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    UIView *myRedView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 30, self.view.frame.origin.y + 100, 100, 100)];
    myRedView.backgroundColor = [UIColor redColor];
    [self.view addSubview: myRedView];
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 90, 40)];
    myLabel.backgroundColor = [UIColor yellowColor];
    myLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightLight];
    myLabel.textColor = [UIColor darkGrayColor];
    myLabel.textAlignment = NSTextAlignmentCenter;
    myLabel.text = @"Hello, World!";
    [myRedView addSubview: myLabel];

    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}


@end
