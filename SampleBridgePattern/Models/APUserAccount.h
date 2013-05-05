//
//  APUserAccount.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "APData.h"

@class APDataList;

@interface APUserAccount : APData

@property (nonatomic, retain) NSSet *lists;
@end

@interface APUserAccount (CoreDataGeneratedAccessors)

- (void)addListsObject:(APDataList *)value;
- (void)removeListsObject:(APDataList *)value;
- (void)addLists:(NSSet *)values;
- (void)removeLists:(NSSet *)values;

@end
