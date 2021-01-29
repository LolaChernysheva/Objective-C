//
//  ViewController.m
//  NSUserDFL
//
//  Created by Лолита on 29.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults stringForKey:@"name"]; // Чтение настроек по ключу name
    NSInteger age = [defaults integerForKey:@"age"]; // Чтение настроек по ключу age

    NSLog(@"name - %@, age - %ld", name, (long)age);

    if (!name || !age) {
        [defaults setObject:@"Steve" forKey:@"name"]; // Сохраняется имя Steve
        [defaults setInteger:56 forKey:@"age"]; // Сохраняется значение 56 для ключа age
    }

    NSLog(@"name - %@, age - %ld", name, (long)age);

    name = [defaults stringForKey:@"name"];
    age = [defaults integerForKey:@"age"];

    NSLog(@"name - %@, age - %ld", name, (long)age);
    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.ru.example.app"];
}


@end
