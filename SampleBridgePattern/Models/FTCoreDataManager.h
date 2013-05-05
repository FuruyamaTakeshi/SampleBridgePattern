//
//  FTCoreDataManager.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTDataBaseManager.h"
#import <CoreData/CoreData.h>
/**
 * @brief 管理クラス
 * @author T.Furuyama
 */
@interface FTCoreDataManager : FTDataBaseManager
{
    NSManagedObjectContext *_managedObjectContext;
}
- (NSManagedObjectContext *)managedObjectContext;
- (NSArray *)sortedContent;
@end
