//
//  SceneDelegate.m
//  TableView
//
//  Created by Лолита on 14.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "FirstViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc]initWithFrame:windowFrame];
    [self.window makeKeyAndVisible];
    
    FirstViewController *firstViewController = [[FirstViewController alloc]init];
    self.window.rootViewController = firstViewController;
    UIWindowScene *windowScene = (UIWindowScene*)scene;
    [self.window setWindowScene:windowScene];
    
    firstViewController.view.backgroundColor = [UIColor yellowColor];
    
    

}


- (void)sceneDidDisconnect:(UIScene *)scene {

}


- (void)sceneDidBecomeActive:(UIScene *)scene {
 
}


- (void)sceneWillResignActive:(UIScene *)scene {

}


- (void)sceneWillEnterForeground:(UIScene *)scene {

}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
}


@end
