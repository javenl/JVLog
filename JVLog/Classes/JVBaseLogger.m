//
//  JVBaseLogger.m
//  JVLog
//
//  Created by liu on 16/4/5.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVBaseLogger.h"
#import "JVLogFilter.h"

@interface JVBaseLogger ()

@end

@implementation JVBaseLogger

- (id)init {
    self = [super init];
    if (self) {
        self.logExtraInfo = JVLogExtraInfoDefault;
        self.logLevel = JVLogLevelDebug;
    }
    return self;
}

@end
