//
//  RCUtility.m
//  SampleNetwork
//
//  Created by 古山 健司 on 12/12/29.
//  Copyright (c) 2012年 TF. All rights reserved.
//

#import "RCUtility.h"

@implementation RCUtility

+ (NSData*)createFormatData:(id)object
{
    LOG_METHOD;
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    return data;
}

+ (NSString*)uuid
{
    LOG_METHOD;
    CFUUIDRef uuid;
    NSString *identifier;
    uuid = CFUUIDCreate(NULL);
    identifier = (NSString*)CFBridgingRelease(CFUUIDCreateString(NULL, uuid));
    CFRelease(uuid);
    return identifier;
}

+ (NSString*)exchangeDateFormatForServer:(NSDate*)date
{
    LOG_METHOD;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}

+ (NSArray *)invertArray:(NSArray *)array
{
    
    return nil;
}

+ (NSString * )randamName
{
    LOG_METHOD
    NSArray *randamAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    NSArray* randamNoumList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];

    int nameIndex = rand() % [randamAdjectiveList count];
    int noumIndex = rand() % [randamNoumList count];
    return [NSString stringWithFormat:@"%@ %@",
            [randamAdjectiveList objectAtIndex:nameIndex], [randamNoumList objectAtIndex:noumIndex]];
}

@end
