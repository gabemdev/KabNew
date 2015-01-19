//
//  KabDetailViewController.m
//  KabNew
//
//  Created by Rockstar. on 11/16/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "KabDetailViewController.h"
#import "KabChannelSchema.h"

@interface KabDetailViewController ()


@end

@implementation KabDetailViewController

#pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)initWithDetailView:(NSString *)view {
    self.channel = [[KabChannelSchema alloc] initWithDetailView:view];
}




@end
