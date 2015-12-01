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
        [self.cpuView setBackgroundColor:[UIColor redColor]];
        [self.contentView addSubview:self.cpuView];
        
        self.memView = [[MTSummaryView alloc] initWithFrame:CGRectMake(kMTWindowWidth/3, 0, kMTWindowWidth*2/3, 0.25*kMTWindowWidth)];
        [self.memView setBackgroundColor:[UIColor greenColor]];
        [self.contentView addSubview:self.memView];
        
        self.fpsView = [[MTSummaryView alloc] initWithFrame:CGRectMake(kMTWindowWidth*2/3, 0, kMTWindowWidth, 0.25*kMTWindowWidth)];
        [self.fpsView setBackgroundColor:[UIColor blueColor]];
        [self.contentView addSubview:self.fpsView];
    }
    return self;
}

@end
