//
//  FirstViewController.m
//  UINavigationController
//
//  Created by Лолита on 18.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor magentaColor];
    [self presentSecondViewController];
    
}

- (void)presentSecondViewController {
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithValue:@"Value"];
    
    [self.navigationController pushViewController: secondViewController animated: YES];
}


@end
