//
//  main.m
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 25.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
