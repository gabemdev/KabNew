//
//  AppDelegate.m
//  KabNew
//
//  Created by Rockstar. on 10/27/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "AppDelegate.h"
#import "KabbalahViewController.h"
#import "BlogViewController.h"
#import "KabTvViewController.h"
#import "MediaViewController.h"
#import "LoginViewController.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "TestFlight.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self setTabBar];
    _window.rootViewController = _tabBarController;
    _window.backgroundColor = [UIColor whiteColor];
    [self.tabBarController setSelectedIndex:2];
    
    [self setStyle];
    [Fabric with:@[CrashlyticsKit]];
    [TestFlight takeOff:@"751fab65-d54b-404b-9eef-137f6836ff9b"];
    
    [_window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Appearance
- (void)setStyle {
    //Status Bar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    //Navigation Bar
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBarStyle:UIBarStyleBlack];
    
    [navigationBar setBarTintColor:[UIColor kabBlueColor]];
    [navigationBar setTitleVerticalPositionAdjustment:-1.0f forBarMetrics:UIBarMetricsDefault];
    
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.2f]];
    [shadow setShadowOffset:CGSizeMake(0.0f, 1.0f)];
    
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0f],
                                            NSShadowAttributeName: shadow,
                                            NSForegroundColorAttributeName: [UIColor whiteColor]
                                            }];
    
    //Toolbar
    UIToolbar *toolbar = [UIToolbar appearance];
    [toolbar setBarStyle:UIBarStyleBlack];
    [toolbar setBarTintColor:[UIColor kabBlueColor]];
    [toolbar setBackgroundColor:[UIColor kabBlueColor]];
    
    //TabBar
    UITabBar *tabBar = [UITabBar appearance];
    [tabBar setTintColor:[UIColor whiteColor]];
    [tabBar setBarTintColor:[UIColor blackColor]];
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}
                              forState:UIControlStateSelected];
    
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}
                              forState:UIControlStateNormal];
    
//    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateSelected];
}

#pragma mark - TabBar
- (void)setTabBar {
    //Edge Insets
    UIEdgeInsets insets = UIEdgeInsetsMake(7.0f, 0.0f, -7.0f, 0.0f);
    
    //Set Tab bar
    self.tabBarController = [[UITabBarController alloc] init];
    [self.tabBarController.tabBar setTintColor:[UIColor whiteColor]];
    
    //Tab Bar Items
    UIViewController *kabbalah = [[KabbalahViewController alloc] init];
    UINavigationController *kabNav = [[UINavigationController alloc] initWithRootViewController:kabbalah];
    [kabNav.navigationBar setTranslucent:NO];
    [kabbalah.tabBarItem setImage:[[UIImage imageNamed:@"140-gradhat"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [kabbalah.tabBarItem setSelectedImage:[[UIImage imageNamed:@"140-gradhat"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [kabbalah.tabBarItem setImageInsets:insets];
    
    UIViewController *blog = [[BlogViewController alloc] init];
    UINavigationController *blogNav = [[UINavigationController alloc] initWithRootViewController:blog];
    [blogNav.navigationBar setTranslucent:NO];
    [blog.tabBarItem setImage:[[UIImage imageNamed:@"29-heart"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [blog.tabBarItem setSelectedImage:[[UIImage imageNamed:@"29-heart"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [blog.tabBarItem setImageInsets:insets];
    
    UIViewController *kabTv = [[KabTvViewController alloc] init];
    UINavigationController *kabTvNav = [[UINavigationController alloc] initWithRootViewController:kabTv];
    [kabTvNav.navigationBar setTranslucent:NO];
    [kabTv.tabBarItem setImage:[[UIImage imageNamed:@"107-widescreen"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [kabTv.tabBarItem setSelectedImage:[[UIImage imageNamed:@"107-widescreen"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [kabTv.tabBarItem setImageInsets:insets];
    
    UIViewController *media = [[MediaViewController alloc] init];
    UINavigationController *mediaNav = [[UINavigationController alloc] initWithRootViewController:media];
    [mediaNav.navigationBar setTranslucent:NO];
    [media.tabBarItem setImage:[[UIImage imageNamed:@"56-cloud"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [media.tabBarItem setSelectedImage:[[UIImage imageNamed:@"56-cloud"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [media.tabBarItem setImageInsets:insets];
    
    UIViewController *ecView = [[LoginViewController alloc] init];
    UINavigationController *ecNav = [[UINavigationController alloc] initWithRootViewController:ecView];
    [ecNav.navigationBar setTranslucent:NO];
    [ecView.tabBarItem setImage:[[UIImage imageNamed:@"123-id-card"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [ecView.tabBarItem setSelectedImage:[[UIImage imageNamed:@"123-id-card"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [ecView.tabBarItem setImageInsets:insets];
    
    self.tabBarController.viewControllers = @[kabNav, blogNav, kabTvNav, mediaNav, ecNav];
}

@end
