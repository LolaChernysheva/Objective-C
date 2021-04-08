//
//  SceneDelegate.m
//  Collection
//
//  Created by Лолита on 27.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstVC.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc]initWithFrame:windowFrame];
    [self.window makeKeyAndVisible];
    
    ViewController *firstController = [[ViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:firstController];
    FirstVC *firstVC = [[FirstVC alloc]init];
    self.window.rootViewController = firstVC;
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    [self.window setWindowScene:windowScene];
}


- (void)sceneDidDisconnect:(UIScene *)scene {

}


- (void)sceneDidBecomeActive:(UIScene *)scene {

}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
}


@end
