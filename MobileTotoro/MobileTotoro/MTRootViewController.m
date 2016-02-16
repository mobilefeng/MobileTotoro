//
//  MTRootViewController.m
//  MobileTotoro
//
//  Created by 徐杨 on 15/11/30.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import "MTRootViewController.h"

#import "MTTableViewController.h"

#import "MTMacro.h"

#import "MTLogoView.h"

@interface MTRootViewController ()

@end

@implementation MTRootViewController

- (id)init {
    if (self = [super init]) {
        self.view.backgroundColor = kMTBackgroundColor;
        
        MTLogoView *logo = [[MTLogoView alloc] initWithFrame:CGRectMake(0.5*kMTWindowWidth, 0.5*kMTWindowHeight, kMTLogoSize, kMTLogoSize)];
        logo.doubleTapBlock = ^{
            MTTableViewController *tableVC = [[MTTableViewController alloc] init];
            [self.navigationController pushViewController:tableVC animated:YES];
        };
        [self.view addSubview:logo];
        
    }
    return self;
}

- (void)btnTouchAction:(id)sender{
    MTTableViewController *tableVC = [[MTTableViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
