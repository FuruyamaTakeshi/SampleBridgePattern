//
//  APProduct.h
//  SampleImageStore
//
//  Created by 古山 健司 on 13/05/02.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "APData.h"

@class APImageData;

@interface APProduct : APData

@property (nonatomic, retain) NSSet *images;
@end

@interface APProduct (CoreDataGeneratedAccessors)

- (void)addImagesObject:(APImageData *)value;
- (void)removeImagesObject:(APImageData *)value;
- (void)addImages:(NSSet *)values;
- (void)removeImages:(NSSet *)values;

@end
