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

@interface MTRootViewController ()

@end

@implementation MTRootViewController

- (id)init {
    if (self = [super init]) {
        self.view.backgroundColor = kMTBackgroundColor;
        
        CGFloat btnWidth = 0.25 * kMTWindowWidth;
        CGFloat btnHeigth = btnWidth;
        CGFloat btnX = (1 - 0.35) * kMTWindowWidth;
        CGFloat btnY = kMTWindowHeight - 0.35 * kMTWindowWidth;
        UIButton *demoButton = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnWidth, btnHeigth)];
        [demoButton setTitle:@"点我啦～" forState:UIControlStateNormal];
        [demoButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [demoButton addTarget:self action:@selector(btnTouchAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:demoButton];
        
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
