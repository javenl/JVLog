//
//  JVLog.h
//  JVLog
//
//  Created by liu on 16/4/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JVLogMacros.h"
#import "JVLoggerProtocol.h"

//#define LOG(fmt) [JVLog log:[NSString stringWithFormat:@"%s(%d): %@", fmt, __PRETTY_FUNCTION__, __LINE__,]]

//#define DLog(format, ...) NSLog(format, ##__VA_ARGS__)


@interface JVLog : NSObject

+ (void)registerLogger:(id<JVLoggerProtocol>)logger;

+ (void)unregisterLogger:(id<JVLoggerProtocol>)logger;

+ (void)log:(NSString *)log;

+ (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file function:(NSString *)function line:(NSString *)line identifier:(NSString *)identifer;

+ (NSString *)levelStringFromLevel:(JVLogLevel)level;

@end