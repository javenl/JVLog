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


@interface JVLogManager : NSObject

/// Register

+ (void)registerLogger:(id<JVLoggerProtocol>)logger;

+ (void)unregisterLogger:(id<JVLoggerProtocol>)logger;

+ (NSArray *)currentLoggers;

/// Log

+ (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file class:(Class)cls function:(NSString *)function line:(NSInteger)line identifier:(NSString *)identifer;

@end