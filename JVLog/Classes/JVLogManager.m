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
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation JVLogManager

- (NSMutableArray *)loggers {
    if (!_loggers) {
        _loggers = [NSMutableArray array];
    }
    return _loggers;
}

+ (JVLogManager *)instance {
    static JVLogManager *log = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        log = [[JVLogManager alloc] init];
        log.dateFormatter = [[NSDateFormatter alloc] init];
        [log.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
        [log.dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    });
    return log;
}

+ (void)registerLogger:(id<JVLoggerProtocol>)logger {
    [[self instance].loggers addObject:logger];
}

+ (void)unregisterLogger:(id<JVLoggerProtocol>)logger {
    [[self instance].loggers removeObject:logger];
}

+ (NSArray *)currentLoggers {
    return [self instance].loggers;
}

#pragma mark - Log

+ (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file class:(Class)cls function:(NSString *)function line:(NSInteger)line identifier:(NSString *)identifer
{
    for (JVBaseLogger<JVLoggerProtocol> *logger in [self instance].loggers) {

        BOOL isExcept = NO;
        NSString *filename = [file lastPathComponent];
        if ([logger.filter isExceptForFile:filename]) {
            isExcept = YES;
        } else if ([logger.filter isExceptForClass:cls]) {
            isExcept = YES;
        } else if ([logger.filter isExceptForFunction:function]) {
            isExcept = YES;
        } else if ([logger.filter isExceptForLine:line]) {
            isExcept = YES;
        } else if ([logger.filter isExceptForIdentifier:identifer]) {
            isExcept = YES;
        }
        
        if (isExcept) { // if is except, log immediately
            NSString *extraString = [self extraStringWithExtraInfo:logger.logExtraInfo level:level file:filename class:cls function:function line:line identifier:identifer];
            NSString *logString = nil;
            if (extraString) {
                logString = [NSString stringWithFormat:@"%@  %@\n", extraString, log];
            } else {
                logString = [NSString stringWithFormat:@"%@\n", log];;
            }
            [logger outputLog:logString];
        } else {
            
            if (level > logger.showLogLevel) {
                continue;
            }
            
            if ([logger.filter isFilterForFile:filename]) {
                continue;
            } else if ([logger.filter isFilterForClass:cls]) {
                continue;
            } else if ([logger.filter isFilterForFunction:function]) {
                continue;
            } else if ([logger.filter isFilterForLine:line]) {
                continue;
            } else if ([logger.filter isFilterForIdentifier:identifer]) {
                continue;
            }
            // no filter, log immediately
            NSString *extraString = [self extraStringWithExtraInfo:logger.logExtraInfo level:level file:filename class:cls function:function line:line identifier:identifer];
            NSString *logString = nil;
            if (extraString) {
                logString = [NSString stringWithFormat:@"%@  %@\n", extraString, log];
            } else {
                logString = [NSString stringWithFormat:@"%@\n", log];;
            }
            [logger outputLog:logString];
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
        extraString = [extraString stringByAppendingFormat:@"(%@)", function];
    }
    if (extraInfo & JVLogExtraInfoLine) {
        extraString = [extraString stringByAppendingFormat:@"[line:%@]", @(line)];
    }
    if (extraInfo & JVLogExtraInfoIdentifier) {
        if (identifer.length > 0) {
            extraString = [extraString stringByAppendingFormat:@"[identifier:%@]", identifer];
        }
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

