//
//  JVLog.h
//  JVLog
//
//  Created by liu on 16/4/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JVLogMacros.h"
#import "JVLoggerProtocol.h"


@interface JVLogManager : NSObject

/// Level

+ (void)setupLogLevel:(JVLogLevel)level;

+ (JVLogLevel)currentLogLevel;

/// Register

+ (void)registerLogger:(id<JVLoggerProtocol>)logger;

+ (void)unregisterLogger:(id<JVLoggerProtocol>)logger;

/// Filter

+ (void)addFilterFiles:(NSArray *)files;
+ (void)addFilterClasses:(NSArray *)clses;
+ (void)addFilterFunctions:(NSArray *)functions;
+ (void)addFilterLines:(NSArray *)lines;
+ (void)addFilterIdentifiers:(NSArray *)identifiers;

+ (void)removeFilterFile:(NSString *)file;
+ (void)removeFilterClass:(Class)cls;
+ (void)removeFilterFunction:(NSString *)function;
+ (void)removeFilterLine:(NSInteger)line;
+ (void)removeFilterIdentifier:(NSString *)identifier;

/// Except

+ (void)addExceptFiles:(NSArray *)files;
+ (void)addExceptClasses:(NSArray *)clses;
+ (void)addExceptFunctions:(NSArray *)functions;
+ (void)addExceptLines:(NSArray *)lines;
+ (void)addExceptIdentifiers:(NSArray *)identifiers;

+ (void)removeExceptFile:(NSString *)file;
+ (void)removeExceptClass:(Class)cls;
+ (void)removeExceptFunction:(NSString *)function;
+ (void)removeExceptLine:(NSInteger)line;
+ (void)removeExceptIdentifier:(NSString *)identifier;

/// Log

+ (void)log:(NSString *)log level:(JVLogLevel)level file:(NSString *)file class:(Class)cls function:(NSString *)function line:(NSInteger)line identifier:(NSString *)identifer;

@end