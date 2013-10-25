//
//  AppDelegate.m
//  JASegmentedControlDemo
//
//  Created by Jad Abi-Abdallah on 04/12/12.
//  Copyright (c) 2012 Inertia. All rights reserved.
//

#import "AppDelegate.h"
#import "JADemo1ViewController.h"
#import "JADemo2ViewController.h"
#import "JADemo3ViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    JADemo1ViewController *viewController1 = [[[JADemo1ViewController alloc] initWithNibName:NSStringFromClass([JADemo1ViewController class])  bundle:nil] autorelease];
    viewController1.title = NSLocalizedString(@"Segments", @"Segments");
    viewController1.tabBarItem.image = [UIImage imageNamed:@"second"];
    
    JADemo2ViewController *viewController2 = [[[JADemo2ViewController alloc] initWithNibName:NSStringFromClass([JADemo2ViewController class])  bundle:nil] autorelease];
    viewController2.title = NSLocalizedString(@"Focus Segments", @"Focus Segments");
    viewController2.tabBarItem.image = [UIImage imageNamed:@"second"];
    
    JADemo3ViewController * viewController3 = [[[JADemo3ViewController alloc] initWithNibName:NSStringFromClass([JADemo3ViewController class]) bundle:nil] autorelease];
    viewController3.title = NSLocalizedString(@"Scrollable Segments", @"Scrollable Segments");
    viewController3.tabBarItem.image = [UIImage imageNamed:@"second"];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = @[viewController1, viewController2, viewController3];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
