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

@property (nonatomic) KabChannelSchema *channel;

- (void)openActionSheet:(id)sender;

@end
