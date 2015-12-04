//
//  AppDelegate.h
//  KabNew
//
//  Created by Rockstar. on 10/27/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, UITabBarDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) UITabBarController *tabBarController;

+ (AppDelegate *)sharedDelegate;


@end

