//
//  AppDelegate.h
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 25.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

