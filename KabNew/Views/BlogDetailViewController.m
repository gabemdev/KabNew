//
//  BlogDetailViewController.m
//  KabNew
//
//  Created by Rockstar. on 11/3/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "BlogDetailViewController.h"
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>



@interface BlogDetailViewController ()
- (void)_updateBrowserUI;
@end

@implementation BlogDetailViewController {
    NSURL *_url;
    UIActivityIndicatorView *_indicator;
    UIBarButtonItem *_backBarButton;
    UIBarButtonItem *_forwardBarButton;
    UIBarButtonItem *_reloadBarButton;
    UIBarButtonItem *_shareBarButton;
}
@synthesize item;
@synthesize webView = _webView;

#pragma mark - UIViewController

- (instancetype)init {
    if ((self = [super init])) {
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Detail"]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 22.0f, 22.0f)];
    _indicator.hidesWhenStopped = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_indicator];
    
    _webView = [[GMWebView alloc] initWithFrame:self.view.bounds];
    _webView.backgroundColor = [UIColor kabStaticColor];
    _webView.translatesAutoresizingMaskIntoConstraints = NO;
    _webView.delegate = self;
    _webView.scalesPageToFit = NO;
    
    NSString *title = [NSString stringWithFormat:@"<b>%@</b>", item[@"title"]];
    NSString *post = [NSString stringWithFormat:@"<p>%@</p>", item[@"summary"]];
    
    NSString *structure =[NSString stringWithFormat:@"<html><head><link rel=\"stylesheet\" type=\"text/css\"href=\"style.css\" ></style></head><body><section id='container'><section id='Blog'>"];
    NSString *close =[NSString stringWithFormat:@"</section><footer id='mainFooter'><div id='mainFooterWrapper'><!--                Widgets Section--><section id='widgetsFooter'><!--                    Footer Widgets--><div class='widgetFooter'><h4>contact us</h4><p>Questions or comments? Please contact us at: <a mailto:'info@kabbalah.info'>info@kabbalah.info</a>.</p></div></section></div></footer></section></body></html>"];
    NSString *HTMLString = [NSString stringWithFormat:@"%@<article><blockquote class='headline-blockquote'>%@</blockquote>%@<hr>%@", structure, title, post, close];
    
    NSString *path = [[NSBundle mainBundle]bundlePath];
    NSURL *base = [NSURL fileURLWithPath:path];
    
    [_webView loadHTMLString:HTMLString baseURL:base];
    [self.view addSubview:_webView];
    
    
    //----------
    // Buttons
    //-----------
    _backBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-button"] landscapeImagePhone:[UIImage imageNamed:@"back-button-mini"] style:UIBarButtonItemStylePlain target:_webView action:@selector(goBack)];
    _backBarButton.tintColor = [UIColor whiteColor];
    
    _forwardBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"forward-button"] landscapeImagePhone:[UIImage imageNamed:@"forward-button-mini"] style:UIBarButtonItemStylePlain target:_webView action:@selector(goForward)];
    _forwardBarButton.tintColor = [UIColor whiteColor];
    
    _reloadBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"safari-button"] landscapeImagePhone:[UIImage imageNamed:@"safari-button-mini"] style:UIBarButtonItemStylePlain target:self action:@selector(openSafari:)];
    _reloadBarButton.tintColor = [UIColor whiteColor];
    
    _shareBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"action-button"] landscapeImagePhone:[UIImage imageNamed:@"action-button-mini"] style:UIBarButtonItemStylePlain target:self action:@selector(openActionSheet:)];
    _shareBarButton.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self.navigationController setToolbarHidden:NO];
    [self updateToolBar];
    self.navigationController.toolbar.tintColor = [UIColor whiteColor];
    
    self.toolbarItems = [NSArray arrayWithObjects:
                         _backBarButton,
                         flex,
                         _forwardBarButton,
                         flex,
                         _reloadBarButton,
                         flex,
                         _shareBarButton, nil];
    
    for (UIBarButtonItem *button in self.toolbarItems) {
        button.imageInsets = UIEdgeInsetsMake(3.0f, 0.0f, 0.0f, 0.0f);
    }
    
    
    //------------
    // Auto Layout
    //------------
    NSDictionary *viewDict = @{@"webView": _webView};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[webView]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[webView]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
    
    if (![_url isFileURL]) {
        [self.navigationController setToolbarHidden:NO animated:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:YES animated:animated];
    [self.tabBarController.tabBar setHidden:NO];
}

#pragma mark - URL Loading
- (void)loadURL:(NSURL *)url {
    _url = url;
}

- (NSURL *)currentURL {
    NSURL *url = _webView.lastRequest.mainDocumentURL;
    if (!url) {
        url = _url;
    }
    return url;
}

#pragma mark - Actions
- (void)close:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)openSafari:(id)sender {
    [[UIApplication sharedApplication] openURL:item[@"feedburner:origLink"]];
}

- (void)openActionSheet:(id)sender {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.1) {
        UIActionSheet *actionSheet = nil;
        
        if ([MFMailComposeViewController canSendMail] == NO) {
            actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Copy URL", nil];
        } else {
            actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Copy URL", @"Email URL", nil];
        }
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        [actionSheet showInView:self.navigationController.view];
    } else {
        if ([UIActivityViewController class]) {
            NSString *url = item[@"link"];
            NSArray *items = @[self, [NSURL URLWithString:[NSString stringWithFormat:@"%@", url]]];
            UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:items
                                                                                                 applicationActivities:nil];
            
            activityViewController.excludedActivityTypes = [[NSArray alloc] initWithObjects:UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeSaveToCameraRoll, UIActivityTypePostToTencentWeibo, UIActivityTypePostToFlickr, UIActivityTypePostToVimeo, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
            
            UIActivityViewControllerCompletionWithItemsHandler completionBlock = ^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
                if (completed) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                } else {
                    [self updateToolBar];
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Oops! Something went wrong!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
            };
            activityViewController.completionWithItemsHandler = completionBlock;
            [self presentViewController:activityViewController animated:YES completion:nil];
            
            
        }
    }
    
}

- (id) activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType {
    NSString *string = [NSString stringWithFormat:@"Check out %@. Via %@", item[@"title"], @"@KabbalahApp"];
    
    if ([activityType isEqualToString:UIActivityTypeMail]) {
        NSMutableString *body = [NSMutableString string];
        [body appendString:@"<html><body><h2>"];
        [body appendString:item[@"title"]];
        [body appendString:@"</h2><p>"];
        [body appendString:item[@"summary"]];
        [body appendString:@"</p><a href=\""];
        [body appendString:item[@"link"]];
        [body appendString:@"\"> Link</a>\n<p>Follow us on <a href=\"http://www.twitter.com/KabbalahApp\">Twitter</a></br>"];
        [body appendString:@"Like us on <a href=\"https://www.facebook.com/KabbalahApp\">Facebook</a></br></p></body></html>"];
        return body;
    } else if ([activityType isEqualToString:UIActivityTypePostToFacebook] || [activityType isEqualToString:UIActivityTypePostToTwitter] || [activityType isEqualToString:UIActivityTypeMessage]) {

        return string;
    } else {
        return nil;
    }
}

- (id) activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController {
    return @"";
}

- (id) activityViewController:(UIActivityViewController *)activityViewController dataTypeIdentifierForActivityType:(NSString *)activityType {
    NSURL *url = [NSURL URLWithString:item[@"feedburner:origLink"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if ([activityType isEqualToString:UIActivityTypePostToTwitter] || [activityType isEqualToString:UIActivityTypePostToFacebook]) {
        return [NSData dataWithContentsOfURL:[NSURL URLWithString:item[@"feedburner:origLink"]]];
    }
    return data;
}


- (void)copyURL:(id)sender {
    [[UIPasteboard generalPasteboard] setURL:self.currentURL];
}

- (void)emailURL:(id)sender {
    if ([MFMailComposeViewController canSendMail] == NO) {
        return;
    }
    
    MFMailComposeViewController *viewController = [[MFMailComposeViewController alloc] init];
    viewController.mailComposeDelegate = self;
    [viewController setToRecipients:@[@""]];
    [viewController setSubject:item[@"title"]];
    [viewController.navigationBar setTintColor:[UIColor whiteColor]];
    NSMutableString *body = [NSMutableString string];
    [viewController setMessageBody:body isHTML:YES];
    [body appendString:@"<h2>"];
    [body appendString:item[@"title"]];
    [body appendString:@"</h2><p>"];
    [body appendString:item[@"summary"]];
    [body appendString:@"</p><a href=\""];
    [body appendString:item[@"link"]];
    [body appendString:@"\"> Link</a>\n<p>Follow us on <a href=\"http://www.twitter.com/KabbalahApp\">Twitter</a></br>"];
    [body appendString:@"Like us on <a href=\"https://www.facebook.com/KabbalahApp\">Facebook</a></br></p>"];
    [viewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self.navigationController presentViewController:viewController animated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }];
}

#pragma mark - Private
- (void)updateToolBar {
    self.navigationController.toolbar.frame = CGRectMake(0.0f, [[UIScreen mainScreen] bounds].size.height - 44, _webView.frame.size.width, 44.0f);
}

- (void)_updateBrowserUI {
    _backBarButton.enabled = [_webView canGoBack];
    _forwardBarButton.enabled = [_webView canGoForward];
    
    UIBarButtonItem *reloadButton = nil;
    
    if ([_webView isLoadingPage]) {
        [_indicator startAnimating];
        reloadButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"stop-button"] landscapeImagePhone:[UIImage imageNamed:@"stop-button-mini"] style:UIBarButtonItemStylePlain target:_webView action:@selector(stopLoading)];
    } else {
        [_indicator stopAnimating];
        reloadButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reload-button"] landscapeImagePhone:[UIImage imageNamed:@"reload-button-mini"] style:UIBarButtonItemStylePlain target:_webView action:@selector(reload)];
    }
    reloadButton.imageInsets = UIEdgeInsetsMake(3.0f, 0.0f, 0.0f, 0.0f);
    
    NSMutableArray *itemsArray = [self.toolbarItems mutableCopy];
    [itemsArray replaceObjectAtIndex:4 withObject:reloadButton];
    self.toolbarItems = itemsArray;
}

#pragma mark - GMWebViewdelegate
- (void)webViewDidStartLoadingPage:(GMWebView *)aWebView {

    [self _updateBrowserUI];
    
//    [self.navigationController setToolbarHidden:[url isFileURL] animated:YES];
}

- (void)webViewDidLoadDOM:(GMWebView *)aWebView {
    NSString *title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (title && title.length > 0) {
            [self.navigationItem setTitle:[NSString stringWithFormat:@"Detail"]];
    }
}

- (void)webViewDidFinishLoadingPage:(GMWebView *)aWebView {
    [self _updateBrowserUI];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self copyURL:actionSheet];
    } else if (buttonIndex == 1 && [MFMailComposeViewController canSendMail]) {
        [self emailURL:actionSheet];
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultSent) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sent" message:nil delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (result == MFMailComposeResultCancelled) {
        [self.navigationController setToolbarHidden:NO];
        [self updateToolBar];
    }
}

@end
