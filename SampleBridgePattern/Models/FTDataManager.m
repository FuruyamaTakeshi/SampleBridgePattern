//
//  FTDataManager.m
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTDataManager.h"
#import "FTDataBaseManagerFactory.h"

@implementation FTDataManager
- (FTDataBaseManager *)dataBaseManager
{
    LOG_METHOD
    if (!_dataBaseManager) {
        _dataBaseManager = [[FTDataBaseManagerFactory sharedManager] createDataBaseManagerType:@"CoreData"];
    }
    return _dataBaseManager;
}
@end
