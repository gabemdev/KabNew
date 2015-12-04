//
//  KabbalahViewController.m
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "KabbalahViewController.h"
#import "CustomCell.h"
#import "KabbalahDetailViewController.h"
#import "FeedAPI.h"
#import "FeedModel.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface KabbalahViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *table;
@property (nonatomic) NSMutableArray *feedArray;

@end

@implementation KabbalahViewController

- (instancetype) init {
    if ((self = [super init])) {
        [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Kabbalah"]];
    self.feedArray = [NSMutableArray new];
    [self setTableView];
    [self checkInternet];
    [self loadFeed];
}

- (void)setTableView {
    _table = [[UITableView alloc] init];
    _table.translatesAutoresizingMaskIntoConstraints = NO;
    _table.backgroundColor = [UIColor lightTextColor];
    _table.delegate = self;
    _table.dataSource = self;
    [_table registerClass:[CustomCell class] forCellReuseIdentifier:@"Cell"];
    _table.scrollEnabled = YES;
    [_table reloadData];
    [self.view addSubview:_table];
    
    NSDictionary *viewDict = @{@"table": _table};
    
    //    NSDictionary *views = NSDictionaryOfVariableBindings(_table)
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_table reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.feedArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor lightTextColor];
    
//    KabChannelSchema *channel = (self.list)[indexPath.row];
    FeedModel *model = [self.feedArray objectAtIndex:indexPath.row];
    [cell.titleLabel setText:model.title];
    [cell.subtitleLabel setText:model.detail];
    [cell.cellImageView setImageWithURL:model.cellImageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.separatorInset = UIEdgeInsetsMake(0.0, 90.0, 0.0, 0.0);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 120;
    }
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *index = [_table indexPathForSelectedRow];
    FeedModel *selected = self.feedArray[indexPath.row];
    KabbalahDetailViewController *detail = [[KabbalahDetailViewController alloc] init];
    [detail setDetailItem:selected];
//    detail.selected = selected;
    self.navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self.navigationController setViewControllers:@[detail]];
    [detail setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:detail animated:YES];
    [_table deselectRowAtIndexPath:index animated:YES];
}

#pragma mark - Helper Methods

- (void)checkInternet {
    _internetReach = [Reachability reachabilityForInternetConnection];
    [_internetReach startNotifier];
    NetworkStatus netStatus = [_internetReach currentReachabilityStatus];
    switch (netStatus)
    {
        case ReachableViaWWAN:
        {
            break;
        }
        case ReachableViaWiFi:
        {
            break;
        }
        case NotReachable:
        {
            [self showAlertWithTitle:@"Alert" andMessage:@"No internet connection detected. Some functionality will be limited until a connection is made."];
            break;
        }
    }
}

- (void)loadFeed {
    [[FeedAPI sharedInstance] requestFeedWithUrl:@"http://m.kab.tv/ios/bbtv/bb-static.json" withCompletion:^(BOOL success, NSData *response, NSError *error) {
        if (!error) {
            NSArray *dictArray = (NSArray *)response;
            for (NSDictionary *dict in dictArray) {
                FeedModel *model = [[FeedModel alloc] initWithDictionary:dict];
                if (![self.feedArray containsObject:model]) {
                    [self.feedArray addObject:model];
                }
            }
            [self sortFeed:self.feedArray];
        } else {
            [self showAlertWithTitle:@"Alert" andMessage:error.localizedDescription];
        }
    }];
}

- (void)sortFeed:(NSArray *)sorted {
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    self.feedArray = [sorted sortedArrayUsingDescriptors:@[descriptor]].mutableCopy;
    [self.table reloadData];
}

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
