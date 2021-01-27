//
//  SceneDelegate.m
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 25.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "FirstViewController.h"
#import "MainViewController.h"
#import "MapViewController.h"
#import "TabBarController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate




- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {

    
    //замеряем экран и забираем bounds
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:windowFrame];
    //делаем window видимым
    [self.window makeKeyAndVisible];
    
    TabBarController *tabBarController = [[TabBarController alloc]init];
    
    
    //MapViewController *mainViewController = [[MapViewController alloc] init];

   // UINavigationController *navigationController = [[UINavigationController alloc] init];
    //[navigationController pushViewController:mainViewController animated:YES];
    
    self.window.rootViewController = tabBarController;;
   
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:navigationController];
    
    
    //self.window.rootViewController = firstController;
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    [self.window setWindowScene:windowScene];
    //firstController.view.backgroundColor = [UIColor greenColor];
    
    
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
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
