//
//  MTAppDelegate.m
//  MobileTotoro
//
//  Created by 徐杨 on 15/11/30.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import "MTAppDelegate.h"

#import "MTRootViewController.h"
#import "MTBaseNavigationController.h"

@interface MTAppDelegate ()

@end

@implementation MTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MTRootViewController *rootViewController = [[MTRootViewController alloc] init];
    MTBaseNavigationController *navController = [[MTBaseNavigationController alloc] initWithRootViewController:rootViewController];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
