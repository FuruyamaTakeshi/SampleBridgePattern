//
//  FTMasterViewController.m
//  SampleBridgePattern
//
//  Created by 古山 健司 on 13/05/03.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTMasterViewController.h"

#import "FTDetailViewController.h"
#import "RCUtility.h"
#import "FTUserAccountManager.h"
#import "APUserAccount.h"
#import "APDataList.h"
#import "APFund.h"

@interface FTMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation FTMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)dealloc
{
    [_detailViewController release];
    [_objects release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (FTDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    FTUserAccountManager  *accountManger = [FTUserAccountManager sharedManager];
    self.accountManager = accountManger;
//    NSArray *array = [accountManger sortedAccounts];
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] initWithCapacity:0];
//    }
//    [_objects addObjectsFromArray:array];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray *array = [self.accountManager sortedAccounts];
    if (!_objects) {
        _objects = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [_objects addObjectsFromArray:array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    APUserAccount* account = [self.accountManager insertNewAccount];
    account.type = @"account";
    account.createDate = [NSDate date];
    NSString * accountId = [RCUtility uuid];
    account.name = [NSString stringWithFormat:@"%@%@", [RCUtility randamName], [accountId substringToIndex:5]];
    account.identifier = accountId;
    APDataList* history =  [self.accountManager insertNewhistory];
    history.identifier = [RCUtility uuid];
    history.name = [history.identifier substringToIndex:5];
    history.type = @"history";
    [account addListsObject:history];
    int randamValue = rand() % 10;
    randamValue = (randamValue==0)?1:randamValue;
    
    for (int i = 0; i < randamValue; i++) {
        APFund * fund =  [self.accountManager insertNewFund];
        accountId = [RCUtility uuid];
        fund.name = [NSString stringWithFormat:@"%@%@", [RCUtility randamName], [accountId substringToIndex:5]];
        fund.identifier = accountId;
        fund.type = @"fund";
        [history addDatasObject:fund];
    }
    [self.accountManager save];
    [_objects insertObject:account atIndex:0];
    NSLog(@"%@", [account description]);
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    APUserAccount *object = _objects[indexPath.row];
    NSArray *histories = [object.lists allObjects];
    APDataList *history = [histories objectAtIndex:0];
    NSArray *funds = [[history datas] allObjects];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@:%d", object.name, [funds count]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDate *object = _objects[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        APUserAccount *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
