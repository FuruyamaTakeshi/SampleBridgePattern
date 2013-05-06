//
//  FTUserAccountManager.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTDataManager.h"
/**
 * @brief データ管理クラス GoF Brigdge Pattern Refined Abstruct
 * @author T.Furuyama
 */
@interface FTUserAccountManager : FTDataManager
/**
 * @brief メソッド
 * @return インスタンス
 */
- (id)insertNewAccount;
/**
 * @brief メソッド
 * @return インスタンス
 */
- (id)insertNewhistory;
/**
 * @brief メソッド
 * @return インスタンス
 */
- (id)insertNewFund;
/**
 * @brief メソッド
 * @return インスタンス
 */
- (void)deleteAccount:(id)account;
/**
 * @brief メソッド
 * @return インスタンス
 */
- (void)save;
/**
 * @brief メソッド
 * @return インスタンス
 */
- (NSArray *)sortedAccounts;
@end
