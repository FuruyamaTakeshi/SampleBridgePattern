//
//  APImageData.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "APData.h"

@class APProduct;

@interface APImageData : APData

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) APProduct *product;

@end
