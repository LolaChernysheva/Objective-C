//
//  CoreDataStack.m
//  lessonCoreData
//
//  Created by Лолита on 29.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "CoreDataStack.h"

@implementation CoreDataStack

- (void)setup {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"lessonCoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];

    NSURL *docsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [docsURL URLByAppendingPathComponent:@"base.sqlite"];
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
        
    NSPersistentStore* store = [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:nil];
        if (!store) {
            abort();
        }
        
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _managedObjectContext.persistentStoreCoordinator = _persistentStoreCoordinator;
    
    //создаем объект, который будем записывать в базу
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Human" inManagedObjectContext:_managedObjectContext];
    //настраиваем этот объект
    [newManagedObject setValue:@"Michael" forKey:@"name"];
    [newManagedObject setValue:@23 forKey:@"age"];
    
    NSError *error;
    //запишем объект в базу
    [_managedObjectContext save:&error];
    
    if (![[self managedObjectContext] save:&error]) {
        NSAssert(NO, @"Error saving context: %@", [error localizedDescription]);
    }
    
    //создаем запрос к базе
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Human"];
    //куда будет записывать
    NSArray *results = [_managedObjectContext executeFetchRequest:request error:&error];
    //обработаем error
    if (![[self managedObjectContext] save:&error]) {
           NSAssert(NO, @"Error saving context: %@", [error localizedDescription]);
    }
    NSLog(@"request");
}


@end
