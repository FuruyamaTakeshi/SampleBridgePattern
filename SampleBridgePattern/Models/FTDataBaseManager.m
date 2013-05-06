//
//  FTDataBaseManager.m
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTDataBaseManager.h"

@implementation FTDataBaseManager
static id _instance = nil;
+ (id)sharedManager
{
    LOG_METHOD
    @synchronized(self) {
        if (!_instance) {
            _instance = [[self alloc] init];
        }
        return _instance;
    }
}
- (id)insertNewEntitiyWithName:(NSString *)entityName
{
    return nil;
}

- (void)deleteContent:(id)content
{
    
}
- (void)save
{
    
}

- (void)update
{
    
}

- (NSArray *)sortedContent
{
    return nil;
}
@end
