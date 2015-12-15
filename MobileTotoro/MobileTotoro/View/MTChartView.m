//
//  MTChartView.m
//  MobileTotoro
//
//  Created by 徐杨 on 15/12/6.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import "MTChartView.h"

// Macro
#import "MTMacro.h"

#define frameWidth      (self.frame.size.width)
#define frameHeight     (self.frame.size.height)
#define outLineXPoint   (0.15*frameHeight)
#define outLineYPoint   (0.1*frameHeight)
#define outLineWidth    (frameWidth-0.25*frameHeight)
#define outLineHeight   (0.8*frameHeight)

@interface MTChartView ()

@property (assign, nonatomic) id<MTChartDataSource> dataSource;

@end

@implementation MTChartView

- (id)initWithFrame:(CGRect)frame withSource:(id<MTChartDataSource>)dataSource {
    self.dataSource = dataSource;
    return [self initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        [self setUpChart];
    }
    return self;
}

- (void)setUpChart {
    [self strokeChartFrame];
    
    if ([self.dataSource respondsToSelector:@selector(MTChartXLabelArray:)]) {
        [self strokeXLabel:[self.dataSource MTChartXLabelArray:self]];
    }
    
    if ([self.dataSource respondsToSelector:@selector(MTChartYLabelArray:)]) {
        [self strokeYLabel:[self.dataSource MTChartYLabelArray:self]];
    }
    
}

// 绘制框线
- (void)strokeChartFrame {
    
    // 绘制内线
    UIBezierPath *inLinePath = [UIBezierPath bezierPath];
    int verNum = 5;
    int horNum = 3;
    for (int verIndex = 0; verIndex < verNum; verIndex ++) {
        [inLinePath moveToPoint:CGPointMake(outLineXPoint + (verIndex+1)*outLineWidth/(verNum+1), outLineYPoint)];
        [inLinePath addLineToPoint:CGPointMake(outLineXPoint + (verIndex+1)*outLineWidth/(verNum+1), outLineYPoint+outLineHeight)];
    }
    for (int horIndex = 0; horIndex < horNum; horIndex ++) {
        [inLinePath moveToPoint:CGPointMake(outLineXPoint, outLineYPoint + (horIndex+1)*outLineHeight/(horNum+1))];
        [inLinePath addLineToPoint:CGPointMake(outLineXPoint + outLineWidth, outLineYPoint + (horIndex+1)*outLineHeight/(horNum+1))];
    }
    
    CAShapeLayer *inLineLayer = [CAShapeLayer layer];
    inLineLayer.strokeColor = kMTInLineColr.CGColor;
    inLineLayer.fillColor = [UIColor clearColor].CGColor;
    inLineLayer.lineCap = kCALineCapSquare;
    inLineLayer.path = inLinePath.CGPath;
    inLinePath.lineWidth = 0.5f;
    [self.layer addSublayer:inLineLayer];
    
    // 绘制外框
    UIBezierPath *outLinePath = [UIBezierPath bezierPathWithRect:CGRectMake(outLineXPoint, outLineYPoint, outLineWidth, outLineHeight)];
    
    CAShapeLayer *outLineLayer = [CAShapeLayer layer];
    outLineLayer.strokeColor = kMTOutLineColor.CGColor;
    outLineLayer.fillColor = [UIColor clearColor].CGColor;
    outLineLayer.lineCap = kCALineCapSquare;
    outLineLayer.path = outLinePath.CGPath;
    outLineLayer.lineWidth = 1.0f;
    [self.layer addSublayer:outLineLayer];
    
}

// 绘制X轴坐标
- (void)strokeXLabel:(NSArray *)xLabelArray {
    NSUInteger xLabelNum = 6;
    for (int index = 0; index <= xLabelNum; index ++) {
        CGFloat labelWidth = 20;
        CGFloat labelHeight = 8;
        CGFloat labelCenterX = outLineXPoint + index*outLineWidth/xLabelNum;
        CGFloat labelCenterY = (outLineYPoint + outLineHeight + frameHeight)/2;
        CGFloat labelX = labelCenterX - labelWidth/2;
        CGFloat labelY = labelCenterY - labelHeight/2;
        
        UILabel *xLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
        if ([xLabelArray count] == xLabelNum+1) {
            xLabel.text = [xLabelArray objectAtIndex:index];
            xLabel.font = [UIFont systemFontOfSize:10];
            xLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:xLabel];
        }
    }
}

// 绘制Y轴坐标
- (void)strokeYLabel:(NSArray *)yLabelArray {
    NSUInteger yLabelNum = 4;
    for (int index = 0; index <= yLabelNum; index ++) {
        CGFloat labelWidth = 20;
        CGFloat labelHeight = 8;
        CGFloat labelCenterX = outLineXPoint/2;
        CGFloat labelCenterY = outLineYPoint + outLineHeight - index*outLineHeight/yLabelNum;
        CGFloat labelX = labelCenterX - labelWidth/2;
        CGFloat labelY = labelCenterY - labelHeight/2;
        
        UILabel *yLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
        if ([yLabelArray count] == yLabelNum+1) {
            yLabel.text = [yLabelArray objectAtIndex:index];
            yLabel.font = [UIFont systemFontOfSize:10];
            yLabel.textAlignment = NSTextAlignmentRight;
            [self addSubview:yLabel];
        }
    }
}

@end
