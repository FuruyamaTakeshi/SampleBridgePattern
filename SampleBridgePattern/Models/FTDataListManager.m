//
//  FTDataListManager.m
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/01.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTDataListManager.h"

@implementation FTDataListManager

static id _shareInstance = nil;
+ (id)sharedManager
{
    @synchronized(self){
        if (!_shareInstance) {
            _shareInstance = [[self alloc] init];
        }
        return _shareInstance;
    }
}

@end
