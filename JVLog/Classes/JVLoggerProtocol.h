//
//  JVLogger.h
//  JVLog
//
//  Created by liu on 16/4/3.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JVLogMacros.h"

@protocol JVLoggerProtocol <NSObject>

- (void)outputLog:(NSString *)log;

@end
