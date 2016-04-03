//
//  JVLogMacros.h
//  JVLog
//
//  Created by liu on 16/4/3.
//  Copyright © 2016年 liu. All rights reserved.
//

#ifndef JVLogMacros_h
#define JVLogMacros_h

#define JVLOG(format, ...) [JVLog log:[[NSString stringWithFormat:(@"[filename:%s]" "[function:%s]" "[line:%d]"), __FILE__, __FUNCTION__, __LINE__] stringByAppendingFormat:format, ##__VA_ARGS__]]

//#define JVLOG(format, ...) [JVLog log:[NSString stringWithFormat:format, ##__VA_ARGS__]]

typedef NS_ENUM(NSInteger, JVLogLevel) {
    JVLogLevelError = 1,
    JVLogLevelWarning = 2,
    JVLogLevelInfo = 3,
    JVLogLevelDebug = 4,
    JVLogLevelVerbose = 5,
};


#endif /* JVLogMacros_h */
