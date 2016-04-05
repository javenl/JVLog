//
//  JVConsoleLogger.m
//  JVLog
//
//  Created by liu on 16/4/3.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVConsoleLogger.h"

@interface JVConsoleLogger ()

@property (strong, nonatomic) dispatch_semaphore_t semaphore;

@end

@implementation JVConsoleLogger

- (id)init {
    self = [super init];
    if (self) {
        self.semaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file function:(NSString *)function line:(NSString *)line identifier:(NSString *)identifer {
//    NSLog(@"i**%@ %@", @(i) , log);
    
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    printf("%s", [log UTF8String]);
    dispatch_semaphore_signal(self.semaphore);
}

@end
