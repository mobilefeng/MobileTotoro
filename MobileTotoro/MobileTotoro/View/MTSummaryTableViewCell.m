//
//  MTSummaryTableViewCell.m
//  MobileTotoro
//
//  Created by 徐杨 on 15/12/1.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import "MTSummaryTableViewCell.h"

// Macro
#import "MTMacro.h"

// View
#import "MTSummaryView.h"

@interface MTSummaryTableViewCell ()

@property (nonatomic, strong) MTSummaryView *cpuView;
@property (nonatomic, strong) MTSummaryView *memView;
@property (nonatomic, strong) MTSummaryView *fpsView;

@end

@implementation MTSummaryTableViewCell

#pragma mark - Init
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cpuView = [[MTSummaryView alloc] initWithFrame:CGRectMake(0, 0, kMTWindowWidth/3, 0.25*kMTWindowWidth)];
        [self.contentView addSubview:self.cpuView];
        
        self.memView = [[MTSummaryView alloc] initWithFrame:CGRectMake(kMTWindowWidth/3, 0, kMTWindowWidth/3, 0.25*kMTWindowWidth)];
        [self.contentView addSubview:self.memView];
        
        self.fpsView = [[MTSummaryView alloc] initWithFrame:CGRectMake(kMTWindowWidth*2/3, 0, kMTWindowWidth/3, 0.25*kMTWindowWidth)];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.fpsView];
    }
    return self;
}

#pragma mark - Data
- (void)refreshSummaryCellWithData:(NSArray *)dataArray {
    // CPU View
    [self.cpuView setTitle:@"CPU"];
    NSNumber *cpuCurrent = [dataArray objectAtIndex:0];
    [self.cpuView setCurrentValue:[NSString stringWithFormat:@"%.2f",cpuCurrent.floatValue]];
    NSNumber *cpuMin = [dataArray objectAtIndex:1];
    [self.cpuView setMinValue:[NSString stringWithFormat:@"%.2f",cpuMin.floatValue]];
    NSNumber *cpuMax = [dataArray objectAtIndex:2];
    [self.cpuView setMaxValue:[NSString stringWithFormat:@"%.2f",cpuMax.floatValue]];
    NSNumber *cpuMean = [dataArray objectAtIndex:3];
    [self.cpuView setMeanValue:[NSString stringWithFormat:@"%.2f",cpuMean.floatValue]];
    
    // MEM View
    [self.memView setTitle:@"MEM"];
    NSNumber *memCurrent = [dataArray objectAtIndex:4];
    [self.memView setCurrentValue:[NSString stringWithFormat:@"%.2f",memCurrent.floatValue]];
    NSNumber *memMin = [dataArray objectAtIndex:5];
    [self.memView setMinValue:[NSString stringWithFormat:@"%.2f",memMin.floatValue]];
    NSNumber *memMax = [dataArray objectAtIndex:6];
    [self.memView setMaxValue:[NSString stringWithFormat:@"%.2f",memMax.floatValue]];
    NSNumber *memMean = [dataArray objectAtIndex:7];
    [self.memView setMeanValue:[NSString stringWithFormat:@"%.2f",memMean.floatValue]];
    
    // FPS View
    [self.fpsView setTitle:@"FPS"];
    [self.fpsView setCurrentValue:@"55Hz"];
}

@end
