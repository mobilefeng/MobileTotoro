//
//  MTSummaryView.m
//  MobileTotoro
//
//  Created by 徐杨 on 15/12/1.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import "MTSummaryView.h"

// Macro
#import "MTMacro.h"

@interface MTSummaryView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *currentValueLabel;
@property (nonatomic, strong) UILabel *minValueLabel;
@property (nonatomic, strong) UILabel *maxValueLabel;
@property (nonatomic, strong) UILabel *meanValueLabel;

@end

@implementation MTSummaryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kMTSummaryViewBackColor;
        self.layer.borderColor = kMTBackgroundColor.CGColor;
        self.layer.borderWidth = 0.5;
        
        CGFloat viewWidth = frame.size.width;
        CGFloat viewHeight = frame.size.height;
        
        {   // titileLabel
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth/12, viewHeight/6, viewWidth/3, viewHeight/3)];
            self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
            self.titleLabel.textAlignment = NSTextAlignmentLeft;
            self.titleLabel.textColor = kMTSummaryGreyColor;
            [self addSubview:self.titleLabel];
        }

        {   // currentValueLabel
            self.currentValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth*5/12, viewHeight/6, viewWidth*7/12, viewHeight/3)];
            self.currentValueLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            self.currentValueLabel.font = [UIFont boldSystemFontOfSize:22.0f];
            self.currentValueLabel.textAlignment = NSTextAlignmentCenter;
            self.currentValueLabel.textColor = kMTSummaryYellowColor;
            [self addSubview:self.currentValueLabel];
        }
        
        {   // minValueLabel
            self.minValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth/24, viewHeight*7/12, viewWidth*7/24, viewHeight/6)];
            self.minValueLabel.font = [UIFont systemFontOfSize:11.0f];
            self.minValueLabel.textAlignment = NSTextAlignmentCenter;
            self.minValueLabel.textColor = kMTSummaryGreyColor;
            [self addSubview:self.minValueLabel];
        }
        
        {   // maxValueLabel
            self.maxValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth*8/24, viewHeight*7/12, viewWidth*7/24, viewHeight/6)];
            self.maxValueLabel.font = [UIFont systemFontOfSize:11.0f];
            self.maxValueLabel.textAlignment = NSTextAlignmentCenter;
            self.maxValueLabel.textColor = kMTSummaryGreyColor;
            [self addSubview:self.maxValueLabel];
        }
        
        {   // meanValueLabel
            self.meanValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth*15/24, viewHeight*7/12, viewWidth*7/24, viewHeight/6)];
            self.meanValueLabel.font = [UIFont systemFontOfSize:11.0f];
            self.meanValueLabel.textAlignment = NSTextAlignmentCenter;
            self.meanValueLabel.textColor = kMTSummaryGreyColor;
            [self addSubview:self.meanValueLabel];
        }
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setCurrentValue:(NSString *)currentValue {
    self.currentValueLabel.text = currentValue;
}

- (void)setMinValue:(NSString *)minValue {
    self.minValueLabel.text = minValue;
}

- (void)setMaxValue:(NSString *)maxValue {
    self.maxValueLabel.text = maxValue;
}

- (void)setMeanValue:(NSString *)meanValue {
    self.meanValueLabel.text = meanValue;
}

@end
