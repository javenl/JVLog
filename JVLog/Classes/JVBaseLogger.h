//
//  JVBaseLogger.h
//  JVLog
//
//  Created by liu on 16/4/5.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JVLogFilter.h"
#import "JVLogMacros.h"

@interface JVBaseLogger : NSObject

@property (strong, nonatomic) JVLogFilter *filter;
@property (assign, nonatomic) JVLogExtraInfo logExtraInfo;
@property (assign, nonatomic) JVLogLevel showLogLevel;

@end
