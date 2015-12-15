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
        [self.contentView addSubview:self.fpsView];
    }
    return self;
}

#pragma mark - Data
- (void)refreshCellWithData:(NSDictionary *)data {
    // CPU View
    [self.cpuView setTitle:@"CPU"];
    [self.cpuView setCurrentValue:[data objectForKey:@"cpuNow"]];
    [self.cpuView setMinValue:[data objectForKey:@"cpuMin"]];
    [self.cpuView setMaxValue:[data objectForKey:@"cpuMax"]];
    [self.cpuView setMeanValue:[data objectForKey:@"cpuMean"]];
    
    // MEM View
    [self.memView setTitle:@"MEM"];
    [self.memView setCurrentValue:[data objectForKey:@"memNow"]];
    [self.memView setMinValue:[data objectForKey:@"memMin"]];
    [self.memView setMaxValue:[data objectForKey:@"memMax"]];
    [self.memView setMeanValue:[data objectForKey:@"memMean"]];
    
    // FPS View
    [self.fpsView setTitle:@"FPS"];
    [self.fpsView setCurrentValue:[data objectForKey:@"fpsNow"]];
}

@end
