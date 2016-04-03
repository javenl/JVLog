//
//  JVFileLogger.h
//  JVLog
//
//  Created by liu on 16/4/3.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JVLoggerProtocol.h"

@interface JVFileLogger : NSObject <JVLoggerProtocol>

- (id)initWithLoggerPath:(NSString *)loggerPath;

@end

@interface JVFileLogger (JVLoggerPath)

+ (NSString *)defaultLogDir;

+ (NSString *)defaultLogPath;

@end