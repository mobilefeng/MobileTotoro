//
//  MTChartTableViewCell.m
//  MobileTotoro
//
//  Created by 徐杨 on 15/12/1.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import "MTChartTableViewCell.h"

#import "MTChartView.h"

// Macro
#import "MTMacro.h"

@interface MTChartTableViewCell ()<MTChartDataSource>

@property (nonatomic, strong) MTChartView* chart;
@property (nonatomic, strong) NSArray *sourceDataArray;

@end

@implementation MTChartTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.chart = [[MTChartView alloc] initWithFrame:CGRectMake(0, 0, kMTWindowWidth, 0.5*kMTWindowWidth) withSource:self];
        [self.contentView addSubview:self.chart];
    }
    return self;
}

- (void)refreshChartCellWithData:(NSArray *)dataArray {
    self.sourceDataArray = dataArray;
    [self.chart drawLineWithData:self.sourceDataArray];
}

- (NSArray *)getArrayFrom:(NSUInteger)start To:(NSUInteger)end WithPointNum:(NSUInteger)pointNum {
    NSMutableArray *arr = [NSMutableArray array];
    NSUInteger interval = (end - start) / (pointNum-1);
    for (int index = 0; index < pointNum; index ++) {
        NSString *str = [NSString stringWithFormat:@"%lu", start+index*interval];
        [arr addObject:str];
    }
    return arr;
}

#pragma mark - MTChartDataSource
- (NSArray *)MTChartXLabelArray:(MTChartView *)chart {
    return [self getArrayFrom:0 To:60 WithPointNum:7];
}

- (NSArray *)MTChartYLabelArray:(MTChartView *)chart {
    return [self getArrayFrom:0 To:100 WithPointNum:5];
}

@end
