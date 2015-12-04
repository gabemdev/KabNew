//
//  BlogViewController.m
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "BlogViewController.h"
#import "BlogCell.h"
#import "Parser.h"
#import "DocumentRoot.h"
#import "Element.h"
//#import "AFXMLRequestOperation.h"
//#import "AFImageRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "BlogDetailViewController.h"
#import "GMHudView.h"

@interface BlogViewController ()<UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate, GMDPTRViewDelegate> {
    
    long long expectedLength;
    long long currentLength;
    
    NSArray *items;
    NSArray *itemsToDisplay;
}

@property (nonatomic) UITableView *table;
@property (nonatomic, retain) NSArray *itemsArray;
@property (nonatomic, retain) NSMutableArray *itemArray;
@property (nonatomic, retain) UIImageView *cellImage;
@property (nonatomic, strong) GMDPTRView *pullToRefreshView;

- (void)loadData;

@end

@implementation BlogViewController
//@synthesize items, itemArray;
//@synthesize cellImage = _cellImage;
//@synthesize table = _table;


- (instancetype)init {
    if ((self = [super init])) {
        [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Blog"]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_texture"]]];
    
    
    NSURL *requestURL = [NSURL URLWithString:NSLocalizedString(@"Blog", nil)];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/xml", @"text/xml"]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Operation: %@, Response: %@", operation, responseObject);
    } failure:nil];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:operation];
    
    [self setTableView];
    
    NSDictionary *viewDict = @{@"table": _table};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]-|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self loadData];
    [self itemsArray];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)setTableView {
    _table = [[UITableView alloc] init];
    _table.translatesAutoresizingMaskIntoConstraints = NO;
    _table.backgroundColor = [UIColor lightTextColor];
    _table.delegate = self;
    _table.dataSource = self;
    [_table registerClass:[BlogCell class] forCellReuseIdentifier:@"Cell"];
    _table.scrollEnabled = YES;
    [_table setRowHeight:82];
    [_table setSeparatorInset:UIEdgeInsetsMake(0.0, 90.0, 0.0, 0.0)];
    [_table reloadData];
    [self.view addSubview:_table];
    
    self.pullToRefreshView = [[GMDPTRView alloc] initWithScrollView:self.table delegate:self];
    
}

- (void)loadData {
    double delayInSeconds = 0.3;
    GMHudView *hud = [[GMHudView alloc] initWithTitle:@"Loading..." loading:YES];
    [hud show];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC);
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(popTime, backgroundQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (items == nil) {
                Parser *rssParser = [[Parser alloc] init];
                [rssParser parseRssFeed:NSLocalizedString(@"Blog", nil) withDelegate:self];
                [self.table reloadData];
                [hud completeAndDismissWithTitle:@"Loaded"];
            } else {
                [self reloadTableData];
                [hud completeAndDismissWithTitle:@"Loaded"];
            }
        });
    });
}

- (void)receivedItems:(NSArray *)theItems {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    items = [theItems sortedArrayUsingDescriptors:@[sortDescriptor]];
    [self.table reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    BlogCell *cell = (BlogCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSString *source = [[items objectAtIndex:indexPath.row] objectForKey:@"summary"];
    DocumentRoot *document = [Element parseHTML:source];
    Element *elements = [document selectElement:@"img"];
    NSString *imageString = [elements attribute:@"src"];
    
//    NSString *snipet = [elements contentsText];
//    snipet = ([snipet length] > 5) ? [snipet substringToIndex:5] : imageString;
//    snipet = [[elements description] stringByAppendingFormat:@"%@", imageString];
    
    if (!cell) {
        cell = [[BlogCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    [cell.cellImageView setImageWithURL:[NSURL URLWithString:imageString]
                       placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [cell.titleLabel setText:items[indexPath.row][@"title"]];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    [cell.subtitleLabel setText:[dateFormatter stringFromDate:items[indexPath.row][@"date"]]];
    cell.separatorInset = UIEdgeInsetsMake(0.0, 90.0, 0.0, 0.0);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 82;
}

#pragma mark - TableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BlogDetailViewController *webView = [[BlogDetailViewController alloc] init];
    webView.item = items[indexPath.row];
    [webView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:webView animated:YES];
    [self.table deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)reloadTableData {
    Parser *rssParser = [[Parser alloc] init];
    [rssParser parseRssFeed:NSLocalizedString(@"Blog", nil) withDelegate:self];
    [_table reloadData];
}

#pragma mark - PTR
- (BOOL)pullToRefreshViewShouldStartLoading:(GMDPTRView *)view {
    return YES;
}

- (BOOL)pullToRefreshViewDidStartLoading:(GMDPTRView *)view {
    [self refresh];
    return YES;
}

- (void)pullToRefreshViewDidFinishLoading:(GMDPTRView *)view {
    
}

- (void)refresh {
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC);
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(popTime, backgroundQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.pullToRefreshView finishLoading];
            [self reloadTableData];
            [self.table reloadData];
        });
    });
}

@end
