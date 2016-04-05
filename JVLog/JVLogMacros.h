//
//  JVLogMacros.h
//  JVLog
//
//  Created by liu on 16/4/3.
//  Copyright © 2016年 liu. All rights reserved.
//

#ifndef JVLogMacros_h
#define JVLogMacros_h

//#define JVLog(str, format, ...) JVLogD(str, format, ...)

#define JVLogE(str, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelError file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __FUNCTION__] line:__LINE__ identifier:str]

#define JVLogW(str, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelWarning file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __FUNCTION__] line:__LINE__ identifier:str]

#define JVLogI(str, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelInfo file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __FUNCTION__] line:__LINE__ identifier:str]

#define JVLogD(str, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelDebug file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __FUNCTION__] line:__LINE__ identifier:str]

#define JVLogV(str, format, ...) [JVLogManager log:[NSString stringWithFormat:format, ##__VA_ARGS__] level:JVLogLevelVerbose file:[NSString stringWithFormat:@"%s", __FILE__] class:[self class] function:[NSString stringWithFormat:@"%s", __FUNCTION__] line:__LINE__ identifier:str]



//#define JVLOG(format, ...) [JVLog log:[NSString stringWithFormat:format, ##__VA_ARGS__]]

typedef NS_ENUM(NSInteger, JVLogLevel) {
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
