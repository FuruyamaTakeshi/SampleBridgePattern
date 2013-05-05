//
//  FTDataManaging.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/01.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * @brief プロトコル
 * @author T.Furuyama
 */
@protocol FTDataManaging <NSObject>
/**
 * @brief CoreDateに新規追加
 * @return 追加したインスタンス
 */
- (id)insertNewEntitiyWithName:(NSString *)entityName;
/**
 * @brief 新規追加
 */
- (void)deleteContent:(id)content;
/**
 * @brief 保存する
 * @return 戻り値なし
 */
- (void)save;
/**
 * @brief 更新
 * @return 戻り値なし
 */
- (void)update;
@end
