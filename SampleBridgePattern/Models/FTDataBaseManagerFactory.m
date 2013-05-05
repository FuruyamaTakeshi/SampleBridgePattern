//
//  FTDataBaseManagerFactory.m
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTDataBaseManagerFactory.h"
#import "FTCoreDataManager.h"

@implementation FTDataBaseManagerFactory
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

- (id)createDataBaseManagerType:(NSString *)type
{
    LOG_METHOD;
    if ([type isEqualToString:@"CoreData"]) {
        return [FTCoreDataManager sharedManager];
    }
    return nil;
}
@end
