//
//  ViewController.m
//  lessonCoreData
//
//  Created by Лолита on 29.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CoreDataStack *stack = [[CoreDataStack alloc]init];
    [stack setup];
}


@end
