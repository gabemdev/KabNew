//
//  MediaViewController.h
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *table;

@end
