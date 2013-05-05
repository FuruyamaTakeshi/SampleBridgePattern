//
//  APDataList.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "APData.h"

@class APData;

@interface APDataList : APData

@property (nonatomic, retain) NSSet *datas;
@property (nonatomic, retain) NSManagedObject *account;
@end

@interface APDataList (CoreDataGeneratedAccessors)

- (void)addDatasObject:(APData *)value;
- (void)removeDatasObject:(APData *)value;
- (void)addDatas:(NSSet *)values;
- (void)removeDatas:(NSSet *)values;

@end
