//
//  KabTVDetailViewController.m
//  KabNew
//
//  Created by Rockstar. on 12/23/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "KabTVDetailViewController.h"

@interface KabTVDetailViewController ()
@property (nonatomic, readonly) NSDictionary *model;
@end

@implementation KabTVDetailViewController
@synthesize backgroundView = _backgroundView;
@synthesize backgroundTitle = _backgroundTitle;
@synthesize titleBackgroundView = _titleBackgroundView;
@synthesize table = _table;

- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = [UIColor kabStaticColor];
        _table.scrollsToTop = YES;
        _table.scrollEnabled = YES;
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_table reloadData];
        _table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _table.separatorColor = [UIColor kabBlueColor];
    }
    return _table;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self layoutConstraints];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *cellData = self.model[@"courses"];
    return cellData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [_table dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor kabStaticColor];
    }
    
    cell.textLabel.text = [self.model[@"courses"] objectAtIndex:indexPath.row][@"courseTitle"];
    cell.detailTextLabel.text = [self.model[@"courses"] objectAtIndex:indexPath.row][@"description"];
    return cell;
    
}

#pragma mark - Configuration
- (void)layoutConstraints {
    NSDictionary *viewDict = @{@"table": self.table};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
}


@end
