//
//  FTDetailViewController.h
//  SampleBridgePattern
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTDetailViewController : UIViewController <UISplitViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UILabel *userAccontNameLabel;
@property (strong, nonatomic) id detailItem;
@property (retain, nonatomic) IBOutlet UILabel *historyNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (retain, nonatomic) IBOutlet UILabel *dateLabel;
- (IBAction)checkButtonDidPush:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *idLabel;
@property (retain, nonatomic) IBOutlet UIButton *checkButton;

@property (strong, nonatomic) NSMutableArray *dataSource;

@end
