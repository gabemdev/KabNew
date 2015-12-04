//
//  KabTVDetailViewController.h
//  KabNew
//
//  Created by Rockstar. on 12/23/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KabTVDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) NSArray *list;
@property (nonatomic, readonly) UIImageView *backgroundView;
@property (nonatomic, readonly) UILabel *backgroundTitle;
@property (nonatomic, readonly) UIImageView *titleBackgroundView;
@property (nonatomic, readonly) UITableView *table;



@end
