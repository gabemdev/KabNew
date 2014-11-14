//
//  BlogViewController.h
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate, GMDPTRViewDelegate> {
    
    long long expectedLength;
    long long currentLength;
    
    NSArray *items;
    NSArray *itemsToDisplay;
}
@property (nonatomic) UITableView *table;
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) NSMutableArray *itemArray;
@property (nonatomic, retain) UIImageView *cellImage;
@property (nonatomic, strong) GMDPTRView *pullToRefreshView;


@end
