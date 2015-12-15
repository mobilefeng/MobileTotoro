//
//  MTPerformanceManager.h
//  MobileTotoro
//
//  Created by 徐杨 on 15/12/14.
//  Copyright © 2015年 xuyang. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <sys/sysctl.h>
#include <sys/types.h>
#include <mach/mach.h>
#include <mach/processor_info.h>
#include <mach/mach_host.h>
#include <sys/cdefs.h>
#import <objc/runtime.h>

@interface MTPerformanceManager : NSObject

+ (instancetype)sharedInstance;

- (void)start;

@end
