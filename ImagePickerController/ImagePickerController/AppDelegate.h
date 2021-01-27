//
//  AppDelegate.h
//  ImagePickerController
//
//  Created by Лолита on 27.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

