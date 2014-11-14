//
//  MediaViewController.m
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "MediaViewController.h"

@interface MediaViewController ()
@property (nonatomic) NSArray *items;
@property (nonatomic) UIImageView *avatarImageView;
@property (nonatomic) UILabel *upgradeLabel;

@end

@implementation MediaViewController
@synthesize table = _table;
@synthesize upgradeLabel = _upgradeLabel;

- (instancetype)init {
    if ((self = [super init])) {
        [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    }
    return self;
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 12.0f, 12.0f)];
        _avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width/2;
        _avatarImageView.layer.borderColor = [[self class] darkTextColor].CGColor;
        _avatarImageView.layer.borderWidth = 1.0f;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.backgroundColor = [UIColor clearColor];
        _avatarImageView.userInteractionEnabled = NO;
        _avatarImageView.image = [UIImage imageNamed:@"list-icon"];
        _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _avatarImageView;
}

- (UILabel *)upgradeLabel {
    if (!_upgradeLabel) {
        _upgradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 60.0f)];
        _upgradeLabel.font = [UIFont systemFontOfSize:14.0f];
        _upgradeLabel.backgroundColor = [UIColor clearColor];
        _upgradeLabel.textAlignment = NSTextAlignmentCenter;
        _upgradeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _upgradeLabel.numberOfLines = 2;
        _upgradeLabel.textColor = [UIColor orangeColor];
        _upgradeLabel.userInteractionEnabled = YES;
    }
    
    return _upgradeLabel;
}

#pragma mark - NSObject
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Kabbalah Media"]];
    [self loadTableView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [self loadData];
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


#pragma mark - UITableView
- (void)loadTableView {
    UILabel *footer = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 32.0f)];
    footer.backgroundColor = [UIColor clearColor];
    footer.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    footer.textAlignment = NSTextAlignmentCenter;
    footer.textColor = [UIColor blackColor];
    footer.font = [UIFont systemFontOfSize:14.0f];
    footer.text = [NSString stringWithFormat:@"Version %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    footer.shadowColor = [UIColor colorWithWhite:0.95f alpha:1.0f];
    footer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _table.translatesAutoresizingMaskIntoConstraints = NO;
    _table.backgroundColor = [UIColor lightTextColor];
    _table.delegate = self;
    _table.dataSource = self;
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _table.scrollEnabled = YES;
    [_table reloadData];
    _table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _table.separatorColor = [UIColor kabBlueColor];
    _table.tableFooterView = footer;
    [self.view addSubview:_table];
    
    NSDictionary *viewDict = @{@"table": _table};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 2;
    }
    else if (section == 2) {
        return 3;
    }
    else if (section == 3) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"None";
    NSUInteger numberOfRows = [_table numberOfRowsInSection:indexPath.section];
    if (numberOfRows == 1) {
        cellIdentifier = @"Both";
    } else if (indexPath.row == 0) {
        cellIdentifier = @"Top";
    } else if (indexPath.row == numberOfRows - 1) {
        cellIdentifier = @"Bottom";
    }
    UITableViewCell *cell = [_table dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"Media Archive";
        cell.textLabel.textColor = [UIColor kabBlueColor];
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Library";
            //        cell.imageView.image = [UIImage imageNamed:@"more-icon-groupgift"];
            cell.textLabel.textColor = [UIColor kabGreenColor];
            cell.detailTextLabel.text = nil;
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"Book Store";
            //        cell.imageView.image = [UIImage imageNamed:@"more-icon-groupgift"];
            cell.textLabel.textColor = [UIColor kabGreenColor];
            cell.detailTextLabel.text = nil;
        }
        
    }
    else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Courses";
            cell.textLabel.textColor = [UIColor kabOrangeColor];
//            cell.imageView.image = [UIImage imageNamed:@"more-icon-terms"];
            cell.detailTextLabel.text = nil;
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"Events";
            cell.textLabel.textColor = [UIColor kabOrangeColor];
//            cell.imageView.image = [UIImage imageNamed:@"more-icon-privacy"];
            cell.detailTextLabel.text = nil;
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"Donations";
            cell.textLabel.textColor = [UIColor kabOrangeColor];
//            cell.imageView.image = [UIImage imageNamed:@"more-icon-help"];
            cell.detailTextLabel.text = nil;
        }
    }
    else if (indexPath.section == 3) {
        cell.textLabel.text = @"Self-Study";
        cell.textLabel.textColor = [UIColor kabSteelColor];
//        cell.imageView.image = [UIImage imageNamed:@"more-icon-signout"];
        cell.detailTextLabel.text = nil;
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section != 1) {
        return nil;
    }
    return self.upgradeLabel;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 50.0f;
    }
    else {
        return 0.0f;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Kabbalah";
    } else if (section == 1) {
        return @"Books";
    } else if (section == 2) {
        return @"About";
    } else if (section == 3) {
        return @"Self-learning";
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 44;
    }
    return 44;
}

#pragma mark - Data
- (void)loadData {
    
}

+ (UIColor *)darkTextColor {
    return [UIColor colorWithRed:0.949f green:0.510f blue:0.380f alpha:1.0f];
}
@end
