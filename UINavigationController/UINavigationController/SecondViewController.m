//
//  SecondViewController.m
//  UINavigationController
//
//  Created by Лолита on 18.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) NSString *value;

@end

@implementation SecondViewController

- (instancetype)initWithValue:(NSString *)value {
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}




@end
