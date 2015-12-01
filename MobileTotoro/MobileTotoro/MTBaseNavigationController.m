//
//  MTBaseNavigationController.m
//  MobileTotoro
//
//  Created by 徐杨 on 15/11/30.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import "MTBaseNavigationController.h"

#import "MTMacro.h"

@interface MTBaseNavigationController ()

@end

@implementation MTBaseNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self.navigationBar setTintColor:kMTThemeColor];
        [[UINavigationBar appearance] setBarTintColor:kMTNavColor];
        
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
    item.title = @"返回";
    viewController.navigationItem.backBarButtonItem = item;
}

@end
