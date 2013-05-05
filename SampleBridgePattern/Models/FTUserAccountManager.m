//
//  FTUserAccountManager.m
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTUserAccountManager.h"
#import "FTDataBaseManager.h"

@implementation FTUserAccountManager

- (id)insertNewAccount
{
    LOG_METHOD
    FTDataBaseManager* dataBaseManager;
    dataBaseManager = [self dataBaseManager];
    return  [dataBaseManager insertNewEntitiyWithName:@"APUserAccount"];;
}

- (id)insertNewhistory
{
    FTDataBaseManager* dataBaseManager;
    dataBaseManager = [self dataBaseManager];
    return  [dataBaseManager insertNewEntitiyWithName:@"APHistory"];
}

- (id)insertNewFund
{
    FTDataBaseManager* dataBaseManager;
    dataBaseManager = [self dataBaseManager];
    return  [dataBaseManager insertNewEntitiyWithName:@"APFund"];
}
- (void)deleteAccount:(id)account
{
    LOG_METHOD
    [[self dataBaseManager] deleteContent:account];
}

- (void)save
{
    LOG_METHOD
    [[self dataBaseManager] save];
}

- (void)update
{
    LOG_METHOD
    [[self dataBaseManager] update];
}

- (NSArray *)sortedAccounts
{
    
    return [[self dataBaseManager] sortedContent];
}
@end
