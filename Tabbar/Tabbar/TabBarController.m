//
//  TabBarController.m
//  Tabbar
//
//  Created by Лолита on 27.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "TabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
        FirstViewController *firstViewController = [[FirstViewController alloc] init];
        firstViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:0];
        UINavigationController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
        
        SecondViewController *secondViewController = [[SecondViewController alloc] init];
        secondViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
        
        //создаем массив контроллеров: свойтво viewControllers - это свойство таббара, которе является массивом
        self.viewControllers = @[firstNavigationController, secondViewController];
        self.tabBar.tintColor = [UIColor blackColor];
        self.selectedIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
