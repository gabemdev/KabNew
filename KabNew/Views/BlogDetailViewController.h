//
//  BlogDetailViewController.h
//  KabNew
//
//  Created by Rockstar. on 11/3/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "GMWebView.h"

@interface BlogDetailViewController : UIViewController <GMWebViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic) GMWebView *webView;
@property (nonatomic, retain) NSDictionary *item;

- (void)loadURL:(NSURL *)url;
- (NSURL *)currentURL;

- (void)close:(id)sender;
- (void)openSafari:(id)sender;
- (void)openActionSheet:(id)sender;
- (void)copyURL:(id)sender;
- (void)emailURL:(id)sender;


@end
NSTimer *timer;