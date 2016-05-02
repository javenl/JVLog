//
//  JVLogMacros.h
//  JVLog
//
//  Created by liu on 16/4/3.
//  Copyright © 2016年 liu. All rights reserved.
//

#ifndef JVLogMacros_h
#define JVLogMacros_h

#define JVLog(format, ...) JVLogD(format, ##__VA_ARGS__)

#define JVLogId(identifier, format, ...) JVLogDId(identifier, format, ##__VA_ARGS__)

#define JVLogEId(id, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelError file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:id]

#define JVLogWId(id, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelWarning file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:id]

#define JVLogIId(id, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelInfo file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:id]

#define JVLogDId(id, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelDebug file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:id]

#define JVLogVId(id, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelVerbose file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:id]

#define JVLogE(format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelError file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:nil]

#define JVLogW(format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelWarning file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:nil]

#define JVLogI(format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelInfo file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:nil]

#define JVLogD(format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelDebug file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:nil]

#define JVLogV(format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelVerbose file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] line:__LINE__ identifier:nil]

typedef NS_ENUM(NSInteger, JVLogLevel) {
    JVLogLevelNone = 0,
    JVLogLevelError = 1,
    JVLogLevelWarning = 2,
    JVLogLevelInfo = 3,
    JVLogLevelDebug = 4,
    JVLogLevelVerbose = 5,
};

typedef NS_ENUM(NSInteger, JVLogExtraInfo) {
    JVLogExtraInfoNone = 0,
    JVLogExtraInfoTime = 1 << 0,
    JVLogExtraInfoLevel = 1 << 1,
    JVLogExtraInfoFile = 1 << 2,
    JVLogExtraInfoClass = 1 << 3,
    JVLogExtraInfoFunction = 1 << 4,
    JVLogExtraInfoLine = 1 << 5,
    JVLogExtraInfoIdentifier = 1 << 6,
    JVLogExtraInfoDefault = JVLogExtraInfoTime | JVLogExtraInfoLevel | JVLogExtraInfoFunction | JVLogExtraInfoIdentifier,
    JVLogExtraInfoFull = JVLogExtraInfoTime | JVLogExtraInfoLevel | JVLogExtraInfoFile | JVLogExtraInfoClass | JVLogExtraInfoFunction | JVLogExtraInfoLine | JVLogExtraInfoIdentifier,
};


#endif /* JVLogMacros_h */
