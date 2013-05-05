//
//  FTDataManager.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTDataManaging.h"
@class FTDataBaseManager;
/**
 * @brief 管理クラス
 * @author T.Furuyama
 */
@interface FTDataManager : NSObject
{
    FTDataBaseManager *_dataBaseManager;
}
/**
 * @brief クラスメソッド
 * @return インスタンス
 */
- (FTDataBaseManager *)dataBaseManager;

@end
