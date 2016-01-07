//
//  MTMacro.h
//  MobileTotoro
//
//  Created by 徐杨 on 15/11/30.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#ifndef MTMacro_h
#define MTMacro_h

// 颜色
#define UIColorFromRGB(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])
#define kMTThemeColor                   (UIColorFromRGB(0xFF4683))
#define kMTNavColor                     (UIColorFromRGB(0xF7F7F7))
#define kMTBackgroundColor              (UIColorFromRGB(0xEEEEEE))
#define kMTSummaryViewBackColor         (UIColorFromRGB(0x37C990))

#define kMTSummaryGreyColor             (UIColorFromRGB(0xF0F0F0))
#define kMTSummaryYellowColor           (UIColorFromRGB(0xF8E71C))

#define kMTOutLineColor                 (UIColorFromRGB(0xBFBFBF))
#define kMTInLineColor                  (UIColorFromRGB(0xEFEFEF))

#define kMTChartLineColor               (UIColorFromRGB(0x43B1FC))
#define kMTChartPointColor              (UIColorFromRGB(0xFD7734))

// 尺寸
#define kMTWindowWidth                  ([UIScreen mainScreen].bounds.size.width)
#define kMTWindowHeight                 ([UIScreen mainScreen].bounds.size.height)

#define kMTLogoSize                     (0.2*kMTWindowWidth)



#endif /* MTMacro_h */
