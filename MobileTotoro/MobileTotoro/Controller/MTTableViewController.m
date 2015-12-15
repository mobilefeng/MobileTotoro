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

/*
 *  Sections
 */
typedef NS_ENUM(NSUInteger, eMTTableViewSection) {
    eMTTableViewSectionSummary = 0,
    eMTTableViewSectionChart,
    eMTTableViewSectionCount,
};

/*
 *  Rows of Chart Section
 */
typedef NS_ENUM(NSUInteger, eMTTableViewChartRow) {
    eMTTableViewChartRowCPU = 0,
    eMTTableViewChartRowMEM,
//    eMTTableViewChartRowFPS,
    eMTTableViewChartRowCount,
};

@interface MTTableViewController ()

@property NSDictionary *summaryData;

@end

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
    
    // 初始化假数据model
    self.summaryData = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"35%", @"cpuNow",
                        @"0%", @"cpuMin",
                        @"98%", @"cpuMax",
                        @"27%", @"cpuMean",
                        @"45M", @"memNow",
                        @"0M", @"memMin",
                        @"70M", @"memMax",
                        @"39M", @"memMean",
                        @"55Hz", @"fpsNow", nil];
}

#pragma mark - Tableview DateSource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return eMTTableViewSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger nuoOfRow = 0;
    
    switch (section) {
        case eMTTableViewSectionSummary: {
            nuoOfRow = 1;
        }
            break;
        case eMTTableViewSectionChart: {
            nuoOfRow = eMTTableViewChartRowCount;
        }
    }
    
    return nuoOfRow;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForCell = 0.0;
    
    switch (indexPath.section) {
        case eMTTableViewSectionSummary: {
            heightForCell = 0.25 * kMTWindowWidth;
        }
            break;
        case eMTTableViewSectionChart: {
            heightForCell = 0.5 * kMTWindowWidth;
        }
            break;
    }
    
    return heightForCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case eMTTableViewSectionSummary: {
            static NSString *cellIdentifier = @"SummaryCell";
            MTSummaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[MTSummaryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            [cell refreshCellWithData:self.summaryData];
            return cell;
        }
            break;
        case eMTTableViewSectionChart: {
            switch (indexPath.row) {
                case eMTTableViewChartRowCPU: {
                    static NSString *cellIdentifier = @"CPUChartCell";
                    MTChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                    if (!cell) {
                        cell = [[MTChartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                    }
                    return cell;
                }
                    break;
                case eMTTableViewChartRowMEM: {
                    
                }
                    break;
            }
        }
            break;
    }
    
    return [[UITableViewCell alloc] init];
}

@end
