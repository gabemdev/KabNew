//
//  KabbalahDetailViewController.m
//  KabNew
//
//  Created by Rockstar. on 11/8/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "KabbalahDetailViewController.h"
#import "UIColor+kabIOSAdditions.h"
#import "UIFont+kabiOSAdditions.h"
#import "UIButton+kabiOSAdditions.h"

@interface KabbalahDetailViewController ()
@property (nonatomic) UIScrollView *scrollView;

@end

@implementation KabbalahDetailViewController
@synthesize mainTitle = _mainTitle;
@synthesize textBackground = _textBackground;
@synthesize detailText = _detailText;
@synthesize viewButton = _viewButton;

- (instancetype)init {
    if ((self = [super init])) {
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(openActionSheet:)];
    [self setScroll];
    [self loadUIViews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setScroll{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = self.view.bounds;
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.delegate = self;
    _scrollView.scrollEnabled = YES;
    [self.view addSubview:_scrollView];
}

- (void)loadUIViews {
    //Main View
    [_scrollView setBackgroundColor:[UIColor kabStaticColor]];
    
    //Main title Image
    UIImage *titleImage = [UIImage imageNamed:[self.channel valueForKey:@"BGTitleImage"]];
    _mainTitle = [[UIImageView alloc] init];
    _mainTitle.frame = CGRectMake(0.0, 3.0f, self.view.bounds.size.width, 182.0f);
    [_mainTitle setImage:titleImage];
    [_scrollView addSubview:_mainTitle];
    
    //detail text
    _textBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 195.0, self.view.bounds.size.width, 250.0f)];
    [_textBackground setBackgroundColor:[UIColor kabStaticColor]];
    [_scrollView addSubview:_textBackground];
    
    _detailText = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 198.0f, self.view.bounds.size.width, 241)];
    _detailText.textColor = [UIColor kabBlueColor];
    _detailText.font = [UIFont kabInterfaceFontOfSize:13.0f];
    _detailText.textAlignment = NSTextAlignmentLeft;
    _detailText.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    _detailText.autocorrectionType = UITextAutocorrectionTypeNo;
    _detailText.editable = NO;
    _detailText.scrollsToTop = YES;
    _detailText.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:_detailText];
    
    [_detailText setText:[self.channel valueForKey:@"detailText"]];
    self.title = [self.channel valueForKey:@"title"];
    
    [self viewButton];
    
}

- (UIButton *)viewButton {
    if (!_viewButton) {
        _viewButton = [UIButton viewButton];
        _viewButton.frame = CGRectMake(10.0f, 454.0f, 300.0f, 42.0f);
        [_viewButton setTitle:@" VIEW" forState:UIControlStateNormal];
        [_viewButton setImage:[UIImage imageNamed:@"icn_nav_bar_light_actions"] forState:UIControlStateNormal];
        [_viewButton setImage:[UIImage imageNamed:@"icn_nav_bar_dark_actions"] forState:UIControlStateHighlighted];
        [_scrollView addSubview:_viewButton];
    }
    return _viewButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _viewButton.alpha = 1.0f;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)openActionSheet:(id)sender {
    
}

@end
