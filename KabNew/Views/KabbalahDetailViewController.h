//
//  KabbalahDetailViewController.h
//  KabNew
//
//  Created by Rockstar. on 11/8/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KabChannelSchema.h"

@interface KabbalahDetailViewController : UIViewController<UITextFieldDelegate, UIActionSheetDelegate, UIScrollViewDelegate>

@property (nonatomic) UIImageView *mainTitle;
@property (nonatomic) UIImageView *textBackground;
@property (nonatomic) UITextView *detailText;
@property (nonatomic) UIButton *viewButton;
@property (nonatomic) KabChannelSchema *channel;

@property (nonatomic, retain) NSString *detailTitle;
@property (nonatomic, retain) NSString *detailDescription;
@property (nonatomic, retain) NSString *detailTextString;
@property (nonatomic, retain) NSString *detailImage;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *detailView;

- (void)openActionSheet:(id)sender;

@end
