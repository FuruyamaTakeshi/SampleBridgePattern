//
//  FTDataListManager.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/01.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTDataManaging.h"
/**
 * @brief ユーザー管理クラス(Singletonモデル）
 */
@interface FTDataListManager : NSObject<FTDataManaging>
/**
 * @brief クラスメソッド
 */
+ (id)sharedManager;
@end
