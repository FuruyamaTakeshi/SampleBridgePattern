//
//  ImplementorFactory.m
//  SampleBridgePattern
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "ImplementorFactory.h"
#import "ConcreteImplementorA.h"
@implementation ImplementorFactory
static id _instance = nil;
+ (id)sharedInstance
{
    LOG_METHOD
    @synchronized(self) {
        if (!_instance) {
            _instance = [[self alloc] init];
        }
        return _instance;
    }
}

- (id)properImplementor
{
    LOG_METHOD
    ConcreteImplementorA *concImp = [[ConcreteImplementorA alloc] init];
    return [concImp autorelease];
}
@end
