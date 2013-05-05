//
//  RCUtility.h
//  SampleNetwork
//
//  Created by 古山 健司 on 12/12/29.
//  Copyright (c) 2012年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * @brief Utilityクラス　(Static)
 * @author TF
 * 
 */
@interface RCUtility : NSObject
/**
 * @brief 転送フォーマット生成メソッド
 * @param [in] 
 * @return (NSData*) 
 */
+ (NSData*)createFormatData:(id)object;
/**
 * @brief UUID生成メソッド
 * @return (NSString*) UUID
 */
+ (NSString*)uuid;
/**
 * @brief 送信用DateFormat変換
 * @param [in] date
 * @return Format整形データ
 */
+ (NSString*)exchangeDateFormatForServer:(NSDate*)date;
/**
 * @brief Arrayの並び替え
 * @param [in] array
 * @return invertしたarrayデータ
 */
+ (NSArray *)invertArray:(NSArray *)array;
/**
 * @brief randam な名前の生成
 * @return　名前
 */
+ (NSString * )randamName;
@end
