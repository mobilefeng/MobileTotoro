//
//  MTSummaryView.h
//  MobileTotoro
//
//  Created by 徐杨 on 15/12/1.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTSummaryView : UIView

- (void)setTitle:(NSString *)title;

- (void)setCurrentValue:(NSString *)currentValue;

- (void)setMinValue:(NSString *)minValue;

- (void)setMaxValue:(NSString *)macValue;

- (void)setMeanValue:(NSString *)meanValue;

@end
