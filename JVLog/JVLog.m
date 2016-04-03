//
//  JVLog.m
//  JVLog
//
//  Created by liu on 16/4/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVLog.h"

@interface JVLog ()

@property (strong, nonatomic) NSMutableArray *loggers;

@end

@implementation JVLog

- (NSMutableArray *)loggers {
    if (!_loggers) {
        _loggers = [NSMutableArray array];
    }
    return _loggers;
}

+ (void)registerLogger:(id<JVLoggerProtocol>)logger {
//    NSMutableArray *loggers = [[self instance] loggers];
//    for (id<JVLoggerProtocol> l in loggers) {
//        if ([l isKindOfClass:[logger]]) {
//            <#statements#>
//        }
//    }
    [[self instance].loggers addObject:logger];
}

+ (void)unregisterLogger:(id<JVLoggerProtocol>)logger {
    [[self instance].loggers removeObject:logger];
}

+ (JVLog *)instance {
    static JVLog *log = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        log = [[JVLog alloc] init];
    });
    return log;
}

+ (void)log:(NSString *)log {
    [self log:log level:JVLogLevelVerbose file:nil function:nil line:nil identifier:nil];
//    va_list args;
//    va_start(args, log);
////    [[self sharedInstance] log:fileName method:(NSString*)method lineNr:lineNr text:format, args];
////    NSLog(log, args);
//    vprintf(log.UTF8String, args);
//    va_end(args);
//    NSLog(@"%@", log);
    
//    NSLog(@"line:%@ function:%s %@", @(__LINE__), __FUNCTION__, log);
//    [NSString stringWithFormat:@"line number %d function %s", __LINE__, __FUNCTION__]
}

+ (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file function:(NSString *)function line:(NSString *)line identifier:(NSString *)identifer {
    for (id<JVLoggerProtocol>l in [self instance].loggers) {
        [l log:log level:level file:file function:function line:log identifier:identifer];
    }
}

+ (NSString *)levelStringFromLevel:(JVLogLevel)level {
    NSString *str = nil;
    switch (level) {
        case JVLogLevelError:
            str = @"Error";
            break;
        case JVLogLevelWarning:
            str = @"Warning";
            break;
        case JVLogLevelInfo:
            str = @"Info";
            break;
        case JVLogLevelDebug:
            str = @"Debug";
            break;
        case JVLogLevelVerbose:
            str = @"Verbose";
            break;
        default:
            str = @"Unknow";
            break;
    }
    return str;
}

@end

