//
//  FTDataBaseManagerFactory.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * @brief Abstract Factoryクラス　Implementクラスのインスタンスを生成する
 * @author T.Furuyama
 */
@interface FTDataBaseManagerFactory : NSObject
+ (id)sharedManager;
- (id)createDataBaseManagerType:(NSString *)type;
@end
