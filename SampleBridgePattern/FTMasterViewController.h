//
//  FTMasterViewController.h
//  SampleBridgePattern
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FTDetailViewController;
@class FTUserAccountManager;

@interface FTMasterViewController : UITableViewController

@property (strong, nonatomic) FTDetailViewController *detailViewController;
@property (strong, nonatomic) FTUserAccountManager *accountManager;
@end
