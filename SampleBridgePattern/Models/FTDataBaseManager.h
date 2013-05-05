//
//  FTDataBaseManager.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTDataManaging.h"
/**
 * @brief 管理クラス
 * @author T.Furuyama
 */
@interface FTDataBaseManager : NSObject <FTDataManaging>
/**
 * @brief クラスメソッド
 * @return インスタンス
 */
+ (id)sharedManager;
/**
 * @brief ソートコンテンツ取得メソッド
 * @return コンテンツ一覧（NSArrayに各インスタンスのポインタが格納される）
 */
- (NSArray *)sortedContent;
@end
