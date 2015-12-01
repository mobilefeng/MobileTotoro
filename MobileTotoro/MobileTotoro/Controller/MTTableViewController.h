//
//  MTTableViewController.h
//  MobileTotoro
//
//  Created by 徐杨 on 15/11/30.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *  Section
 */
enum {
    kMTTableViewSectionSummary = 0,
    kMTTableViewSectionChart,
    kMTTableViewSectionCount,
};

/*
 *  Row of Section
 */
enum {
    kMTTableViewChartRowCPU = 0,
    kMTTableViewChartRowMEM,
    kMTTableViewChartRowFPS,
    kMTTableViewChartRowCount,
};

@interface MTTableViewController : UITableViewController

@end
