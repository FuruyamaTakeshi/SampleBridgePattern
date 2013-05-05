//
//  ImplementorFactory.h
//  SampleBridgePattern
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * @brief Factoryクラス
 */
@interface ImplementorFactory : NSObject
/**
 * @brief クラスメソッド
 */
+ (id)sharedInstance;

- (id)properImplementor;
@end
