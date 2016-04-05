//
//  JVLog.m
//  JVLog
//
//  Created by liu on 16/4/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVLogManager.h"
#import "JVLogFilter.h"
#import "JVBaseLogger.h"

@interface JVLogManager ()

@property (strong, nonatomic) NSMutableArray *loggers;
//@property (assign, nonatomic) JVLogLevel logLevel;
//@property (strong, nonatomic) JVLogFilter *filter;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation JVLogManager

- (NSMutableArray *)loggers {
    if (!_loggers) {
        _loggers = [NSMutableArray array];
    }
    return _loggers;
}

- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
        [_dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    }
    return _dateFormatter;
}

//- (JVLogFilter *)filter {
//    if (!_filter) {
//        _filter = [[JVLogFilter alloc] init];
//    }
//    return _filter;
//}

+ (JVLogManager *)instance {
    static JVLogManager *log = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        log = [[JVLogManager alloc] init];
//        log.logLevel = JVLogLevelDebug;
    });
    return log;
}

//+ (void)setupLogLevel:(JVLogLevel)level {
//    [self instance].logLevel = level;
//}
//
//+ (JVLogLevel)currentLogLevel {
//    return [self instance].logLevel;
//}

+ (void)registerLogger:(id<JVLoggerProtocol>)logger {
//    NSMutableArray *loggers = [[self instance] loggers];
//    for (id<JVLoggerProtocol> l in loggers) {
//        if ([l isKindOfClass:[logger]]) {
//
//        }
//    }
    [[self instance].loggers addObject:logger];
}

+ (void)unregisterLogger:(id<JVLoggerProtocol>)logger {
    [[self instance].loggers removeObject:logger];
}

+ (NSArray *)currentLoggers {
    return [self instance].loggers;
}

#pragma mark - Log
/*
+ (void)log:(NSString *)log {
    [self log:log level:JVLogLevelDebug file:nil class:nil function:nil line:0 identifier:nil];
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
*/
+ (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file class:(Class)cls function:(NSString *)function line:(NSInteger)line identifier:(NSString *)identifer
{
    for (JVBaseLogger<JVLoggerProtocol> *l in [self instance].loggers) {
        if (level > l.logLevel) {
            continue;
        }
        
        BOOL isExcept = NO;
        NSString *filename = [file lastPathComponent];
        if ([l.filter isExceptForFile:filename]) {
            isExcept = YES;
        } else if ([l.filter isExceptForClass:cls]) {
            isExcept = YES;
        } else if ([l.filter isExceptForFunction:function]) {
            isExcept = YES;
        } else if ([l.filter isExceptForLine:line]) {
            isExcept = YES;
        } else if ([l.filter isExceptForIdentifier:identifer]) {
            isExcept = YES;
        }
        
        if (isExcept) { // if is except, log immediately
            NSString *extraString = [self extraStringWithExtraInfo:l.logExtraInfo level:level file:filename class:cls function:function line:line identifier:identifer];
            NSString *logString = nil;
            if (extraString) {
                logString = [NSString stringWithFormat:@"%@  %@\n", extraString, log];
            } else {
                logString = [NSString stringWithFormat:@"%@\n", log];;
            }
            [l outputLog:logString];
        } else {
            if ([l.filter isFilterForFile:filename]) {
                continue;
            } else if ([l.filter isFilterForClass:cls]) {
                continue;
            } else if ([l.filter isFilterForFunction:function]) {
                continue;
            } else if ([l.filter isFilterForLine:line]) {
                continue;
            } else if ([l.filter isFilterForIdentifier:identifer]) {
                continue;
            }
            // no filter, log immediately
//            [l log:log level:level file:file function:function line:log identifier:identifer];
            NSString *extraString = [self extraStringWithExtraInfo:l.logExtraInfo level:level file:filename class:cls function:function line:line identifier:identifer];
            NSString *logString = nil;
            if (extraString) {
                logString = [NSString stringWithFormat:@"%@  %@\n", extraString, log];
            } else {
                logString = [NSString stringWithFormat:@"%@\n", log];;
            }
            [l outputLog:logString];
        }
    }
}

+ (NSString *)extraStringWithExtraInfo:(JVLogExtraInfo)extraInfo level:(JVLogLevel)level file:(NSString *)file class:(Class)cls function:(NSString *)function line:(NSInteger)line identifier:(NSString *)identifer
{
    NSString *extraString = @"";
    if (extraInfo == JVLogExtraInfoNone) {
        return nil;
    }
    if (extraInfo & JVLogExtraInfoTime) {
        NSString *timeString = [[self instance].dateFormatter stringFromDate:[NSDate date]];
        extraString = [extraString stringByAppendingFormat:@"[%@]", timeString];
    }
    if (extraInfo & JVLogExtraInfoLevel) {
        extraString = [extraString stringByAppendingFormat:@"[%@]", [self levelStringFromLevel:level]];
    }
    if (extraInfo & JVLogExtraInfoFile) {
        extraString = [extraString stringByAppendingFormat:@"[%@]", file];
    }
    if (extraInfo & JVLogExtraInfoClass) {
        extraString = [extraString stringByAppendingFormat:@"[%@ class]", NSStringFromClass(cls)];
    }
    if (extraInfo & JVLogExtraInfoFunction) {
//        extraString = [extraString stringByAppendingFormat:@"[function:%@]", function];
        extraString = [extraString stringByAppendingFormat:@"(%@)", function];
    }
    if (extraInfo & JVLogExtraInfoLine) {
        extraString = [extraString stringByAppendingFormat:@"[line:%@]", @(line)];
    }
    if (extraInfo & JVLogExtraInfoIdentifier) {
        extraString = [extraString stringByAppendingFormat:@"[identifier:%@]", identifer];
    }
    return extraString;
}

+ (NSString *)levelStringFromLevel:(JVLogLevel)level {
    NSString *str = nil;
    switch (level) {
        case JVLogLevelError:
            str = @"⛔️ Error";
            break;
        case JVLogLevelWarning:
            str = @"⚠️ Warning";
            break;
        case JVLogLevelInfo:
            str = @"❕ Info";
            break;
        case JVLogLevelDebug:
            str = @"✅ Debug";
            break;
        case JVLogLevelVerbose:
            str = @"💭 Verbose";
            break;
        default:
            str = @"Unknow";
            break;
    }
    return str;
}

@end

