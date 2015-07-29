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
@property (nonatomic) UIImageView *mainTitle;
@property (nonatomic) UIImageView *textBackground;
@property (nonatomic) UITextView *detailText;
@property (nonatomic) UIButton *viewButton;

@property (nonatomic, retain) NSString *detailTitle;
@property (nonatomic, retain) NSString *detailDescription;
@property (nonatomic, retain) NSString *detailTextString;
@property (nonatomic, retain) NSString *detailImage;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *detailView;

@end

@implementation KabbalahDetailViewController
//@synthesize mainTitle = _mainTitle;
//@synthesize textBackground = _textBackground;
//@synthesize detailText = _detailText;
//@synthesize viewButton = _viewButton;
//@synthesize scrollView = _scrollView;

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.alwaysBounceVertical = YES;
    }
    return _scrollView;
}

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
        [self.view addSubview:self.scrollView];
    [self loadUIViews];
    [self setupConstraints];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    _detailText.font = [UIFont kabInterfaceFontOfSize:UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 26.0 : 13.0];
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
        _viewButton.translatesAutoresizingMaskIntoConstraints = NO;
//        _viewButton.frame = CGRectMake(10.0f, 454.0f, 300.0f, 42.0f);
        [_viewButton setTitle:@" VIEW" forState:UIControlStateNormal];
        [_viewButton setImage:[UIImage imageNamed:@"icn_nav_bar_light_actions"] forState:UIControlStateNormal];
        [_viewButton setImage:[UIImage imageNamed:@"icn_nav_bar_dark_actions"] forState:UIControlStateHighlighted];
        [_viewButton addTarget:self action:@selector(pressedView:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:_viewButton];
    }
    return _viewButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    _viewButton.alpha = 1.0f;
}

- (void)pressedView:(id)sender {
    
}

- (void)openActionSheet:(id)sender {
    
}

#pragma mark - Configuration

- (CGFloat)verticalSpacing {
    return 16.0;
}

- (void)setupConstraints {
    CGFloat verticalSpacing = self.verticalSpacing;
    
    NSDictionary *views = @{
                            @"scrollView" : self.scrollView,
                            @"button" : self.viewButton
                            };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[scrollView]|" options:kNilOptions metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:kNilOptions metrics:nil views:views]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.viewButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.viewButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:200]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.viewButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:42]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.viewButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:verticalSpacing]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.viewButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeRight multiplier:1.0 constant:verticalSpacing]];

    
}


@end
