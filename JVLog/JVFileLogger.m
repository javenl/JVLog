//
//  JVFileLogger.m
//  JVLog
//
//  Created by liu on 16/4/3.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVFileLogger.h"

@interface JVFileLogger ()

@property (strong, nonatomic) NSFileHandle *filehandle;

@end

@implementation JVFileLogger

- (void)dealloc {
    [self.filehandle closeFile];
}

- (id)init {
    return [self initWithLoggerPath:[JVFileLogger defaultLogPath]];
}

- (id)initWithLoggerPath:(NSString *)loggerPath {
    self = [super init];
    if (self) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:loggerPath]) {
            NSString *dir = [loggerPath stringByDeletingLastPathComponent];
            if (![[NSFileManager defaultManager] fileExistsAtPath:dir]) {
                NSError *error;
                [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&error];
                NSAssert(error == nil, @"create log dir fail");
            }
            
            BOOL isSuccess = [[NSFileManager defaultManager] createFileAtPath:loggerPath contents:nil attributes:nil];
            NSAssert(isSuccess == YES, @"create log path fail");
        }
        
        NSLog(@"loggerPath %@", loggerPath);
        self.filehandle = [NSFileHandle fileHandleForWritingAtPath:loggerPath];
        NSAssert(self.filehandle != nil, @"open file fail");
        
        [self.filehandle seekToEndOfFile];
    }
    return self;
}

- (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file function:(NSString *)function line:(NSString *)line identifier:(NSString *)identifer {
//    NSString *str = [NSString stringWithFormat:@"%@\n", log];
    [self.filehandle writeData:[log dataUsingEncoding:NSUTF8StringEncoding]];
}

@end

@implementation JVFileLogger (JVLoggerPath)

+ (NSString *)defaultLogDir {
    NSString *dir = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"JVLog"];
    return dir;
}

+ (NSString *)defaultLogPath {
    return [[self defaultLogDir] stringByAppendingPathComponent:@"JVLog.log"];
}

@end
