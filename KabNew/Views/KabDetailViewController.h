//
//  KabDetailViewController.h
//  KabNew
//
//  Created by Rockstar. on 11/16/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KabChannelSchema;

@interface KabDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray *list;
@property (nonatomic) UIImageView *backgroundView;
@property (nonatomic) UILabel *backgroundTitle;
@property (nonatomic) UIImageView *titleBackgroundView;
@property (nonatomic) KabChannelSchema *channel;

@property (nonatomic) UITableView *table;

@end
