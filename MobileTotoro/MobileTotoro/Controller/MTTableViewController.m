//
//  MTTableViewController.m
//  MobileTotoro
//
//  Created by 徐杨 on 15/11/30.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import "MTTableViewController.h"

// Macro
#import "MTMacro.h"

// Cell
#import "MTSummaryTableViewCell.h"
#import "MTChartTableViewCell.h"

@implementation MTTableViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tableView属性
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundView = [[UIView alloc] init];
    self.tableView.backgroundView.backgroundColor = kMTBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    // 设置navigation属性
    [self.navigationItem setTitle:@"MobileTotoro"];
}

#pragma mark - Tableview DateSource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kMTTableViewSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger nuoOfRow = 0;
    
    switch (section) {
        case kMTTableViewSectionSummary: {
            nuoOfRow = 1;
        }
            break;
        case kMTTableViewSectionChart: {
            nuoOfRow = kMTTableViewChartRowCount;
        }
    }
    
    return nuoOfRow;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForCell = 0.0;
    
    switch (indexPath.section) {
        case kMTTableViewSectionSummary: {
            heightForCell = 0.25 * kMTWindowWidth;
        }
            break;
        case kMTTableViewSectionChart: {
            heightForCell = 0.5 * kMTWindowWidth;
        }
    }
    
    return heightForCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case kMTTableViewSectionSummary: {
            static NSString *cellIdentifier = @"SummaryCell";
            MTSummaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[MTSummaryTableViewCell alloc] init];
            }
            return cell;
        }
            break;
        case kMTTableViewSectionChart: {
            
        }
    }
    
    return [[UITableViewCell alloc] init];
}

@end
