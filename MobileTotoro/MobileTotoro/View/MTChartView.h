//
//  MTChartView.h
//  MobileTotoro
//
//  Created by 徐杨 on 15/12/6.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *  MTChartDataSource
 */
@class MTChartView;
@protocol MTChartDataSource <NSObject>

@end

/*
 *  MTChartView
 */
@interface MTChartView : UIView

- (id)initWithFrame:(CGRect)frame withSource:(id<MTChartDataSource>)dataSource;

- (void)drawLineWithData:(NSArray *)dataArray;

@end
