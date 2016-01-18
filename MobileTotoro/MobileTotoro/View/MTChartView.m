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
#define scrollPageNum   (10)

@interface MTChartView ()

@property (assign, nonatomic) id<MTChartDataSource> dataSource;

@property (nonatomic) CGFloat yValueMin;
@property (nonatomic) CGFloat yValueMax;
@property (nonatomic, strong) UIScrollView *chartScrollView;
@property (nonatomic, strong) UIView *chartFullView;
@property (nonatomic, strong) NSArray *xLabelArray;
@property (nonatomic, strong) NSArray *yLabelArray;

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
        self.yValueMin = 0;
        self.yValueMax = 100;
        
        CGRect scrollRect = CGRectMake(outLineXPoint, 0, outLineWidth, frameHeight);
        self.chartScrollView = [[UIScrollView alloc] initWithFrame:scrollRect];
        [self addSubview:self.chartScrollView];
        
        CGRect fullRect = CGRectMake(0, 0, outLineWidth*scrollPageNum, frameHeight);
        self.chartFullView = [[UIView alloc] initWithFrame:fullRect];
        [self.chartScrollView addSubview:self.chartFullView];
        self.chartScrollView.contentSize = fullRect.size;
        
        self.xLabelArray = [self getArrayFrom:0 To:60*scrollPageNum WithPointNum:6*scrollPageNum+1];
        self.yLabelArray = [self getArrayFrom:0 To:100 WithPointNum:5];
        
        [self setUpChart];
    }
    return self;
}

- (void)setUpChart {
    [self strokeChartFrame];
    
    [self strokeXLabel];
    
    [self strokeYLabel];
}

- (void)drawLineWithData:(NSArray *)dataArray {
    
    if (dataArray.count <=0) {
        return;
    }
    
    // 初始化layer
    CAShapeLayer *chartLineLayer = [CAShapeLayer layer];
    [self.chartFullView.layer addSublayer:chartLineLayer];
    
    // 初始化path
    UIBezierPath *chartLinePath = [UIBezierPath bezierPath];
    [chartLinePath setLineCapStyle:kCGLineCapRound];
    [chartLinePath setLineJoinStyle:kCGLineJoinRound];
    
    // 添加原点
    CGPoint originPoint = CGPointMake(0, outLineYPoint+outLineHeight);
//    [self addPoint:originPoint atIndex:0 withValue:0];
    [chartLinePath moveToPoint:originPoint];
    
    // 添加线和点
    for (int ii = 0; ii < dataArray.count; ii ++) {
        
        NSNumber *pointData = dataArray[ii];
        CGFloat pointValue = pointData.doubleValue;
        CGFloat normalizedValue = (pointValue - self.yValueMin)/(self.yValueMax - self.yValueMin);
        
        CGPoint chartPoint = CGPointMake((ii+1)*outLineWidth/60, outLineYPoint+outLineHeight-normalizedValue*outLineHeight);
        [chartLinePath addLineToPoint:chartPoint];
        
        // 添加Point则可以支持点击显示值，但这块会导致内存增加较快，故先注释掉
//        [self addPoint:chartPoint atIndex:(ii+1) withValue:pointValue];
        [chartLinePath moveToPoint:chartPoint];
    }
    
    // 绘制线
    chartLineLayer.path = chartLinePath.CGPath;
    chartLineLayer.strokeColor = kMTChartLineColor.CGColor;
    chartLineLayer.fillColor = [UIColor clearColor].CGColor;
    chartLineLayer.lineWidth = 1.0;
    
}

- (void)addPoint:(CGPoint)point atIndex:(NSUInteger)index withValue:(CGFloat)value {
    UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 4)];
    pointView.center = point;
    pointView.layer.masksToBounds = YES;
    pointView.layer.cornerRadius = 2;
    pointView.layer.borderWidth = 0.5;
    pointView.layer.borderColor = [UIColor whiteColor].CGColor;
    pointView.layer.backgroundColor = kMTChartPointColor.CGColor;
    
    [self.chartFullView addSubview:pointView];
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
    inLineLayer.strokeColor = kMTInLineColor.CGColor;
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
- (void)strokeXLabel {
    NSUInteger xLabelNum = 6;
    for (int index = 0; index <= xLabelNum*scrollPageNum; index ++) {
        CGFloat labelWidth = 20;
        CGFloat labelHeight = 8;
        CGFloat labelCenterX = index*outLineWidth/xLabelNum + labelWidth/2;
        CGFloat labelCenterY = (outLineYPoint + outLineHeight + frameHeight)/2;
        CGFloat labelX = labelCenterX - labelWidth/2;
        CGFloat labelY = labelCenterY - labelHeight/2;
        
        UILabel *xLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];

        xLabel.text = [self.xLabelArray objectAtIndex:index];
        xLabel.font = [UIFont systemFontOfSize:10];
        xLabel.textAlignment = NSTextAlignmentLeft;
        [self.chartFullView addSubview:xLabel];

    }
}

// 绘制Y轴坐标
- (void)strokeYLabel {
    NSUInteger yLabelNum = 4;
    for (int index = 0; index <= yLabelNum; index ++) {
        CGFloat labelWidth = 20;
        CGFloat labelHeight = 8;
        CGFloat labelCenterX = outLineXPoint/2;
        CGFloat labelCenterY = outLineYPoint + outLineHeight - index*outLineHeight/yLabelNum;
        CGFloat labelX = labelCenterX - labelWidth/2;
        CGFloat labelY = labelCenterY - labelHeight/2;
        
        UILabel *yLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];

        yLabel.text = [self.yLabelArray objectAtIndex:index];
        yLabel.font = [UIFont systemFontOfSize:10];
        yLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:yLabel];
    }
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

@end
