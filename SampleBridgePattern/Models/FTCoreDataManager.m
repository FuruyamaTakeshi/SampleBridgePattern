//
//  FTCoreDataManager.m
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTCoreDataManager.h"
#import "APUserAccount.h"

@implementation FTCoreDataManager
- (NSManagedObjectContext *)managedObjectContext
{
    LOG_METHOD
    
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    NSManagedObjectModel *managedObjectModel;
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    NSPersistentStoreCoordinator *persistentStoreCoodinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    NSArray *paths;
    NSString *path = nil;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
        path = [paths objectAtIndex:0];
        path = [path stringByAppendingPathComponent:@"DataBase"];
        path = [path stringByAppendingPathComponent:@"db.sqlite"];
    }
    if (!path) {
        return nil;
    }
    NSString *dirPath = [path stringByDeletingLastPathComponent];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dirPath]) {
        NSError *error = nil;
        if ([fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"Failed to create directory at path %@, error %@", dirPath, [error localizedDescription]);
        }
    }
    NSURL *url = [NSURL fileURLWithPath:path];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    NSError *error = nil;
    NSPersistentStore *store =[persistentStoreCoodinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:options error:&error];
    if (!store && error) {
        NSLog(@"Failed to create add persistent sotre. %@", [error localizedDescription]);
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:persistentStoreCoodinator];
    return  _managedObjectContext;
}

- (id)insertNewContent
{
    LOG_METHOD;
    return [self insertNewEntitiyWithName:@"APUserAccount"];
}

- (void)deleteContent:(id)content
{
    LOG_METHOD
    NSManagedObjectContext *context = self.managedObjectContext;
    [context deleteObject:content];
}

- (void)save
{
    LOG_METHOD
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Core Data error %@", [error localizedDescription]);
    }
}

- (void)update
{
    LOG_METHOD
    [self save];
}

- (NSArray *)sortedContent
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"APUserAccount" inManagedObjectContext:context]];
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"createDate" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    NSError *error = nil;
    NSArray *entities = [context executeFetchRequest:request error:&error];
    if ([entities count] > 0) {
        return entities;
    }
    else {
        return nil;
    }
    
}

#pragma mark -
- (id)insertNewEntitiyWithName:(NSString *)entityName;
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSManagedObject* object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
    return object;
}
@end
