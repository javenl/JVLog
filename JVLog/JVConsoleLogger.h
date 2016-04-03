//
//  JVConsoleLogger.h
//  JVLog
//
//  Created by liu on 16/4/3.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JVLoggerProtocol.h"

@interface JVConsoleLogger : NSObject <JVLoggerProtocol>

+ (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file function:(NSString *)function line:(NSString *)line identifier:(NSString *)identifer;

@end
