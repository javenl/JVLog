//
//  JVLogFilter.h
//  JVLog
//
//  Created by liu on 16/4/4.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JVLogFilter : NSObject

/// Filter

- (void)addFilterFiles:(NSArray *)files;
- (void)addFilterClasses:(NSArray *)clses;
- (void)addFilterFunctions:(NSArray *)functions;
- (void)addFilterLines:(NSArray *)lines;
- (void)addFilterIdentifiers:(NSArray *)identifiers;

- (void)removeFilterFile:(NSString *)file;
- (void)removeFilterClass:(Class)cls;
- (void)removeFilterFunction:(NSString *)function;
- (void)removeFilterLine:(NSInteger)line;
- (void)removeFilterIdentifier:(NSString *)identifier;

/// Except

- (void)addExceptFiles:(NSArray *)files;
- (void)addExceptClasses:(NSArray *)clses;
- (void)addExceptFunctions:(NSArray *)functions;
- (void)addExceptLines:(NSArray *)lines;
- (void)addExceptIdentifiers:(NSArray *)identifiers;

- (void)removeExceptFile:(NSString *)file;
- (void)removeExceptClass:(Class)cls;
- (void)removeExceptFunction:(NSString *)function;
- (void)removeExceptLine:(NSInteger)line;
- (void)removeExceptIdentifier:(NSString *)identifier;

/// Filter

- (BOOL)isFilterForFunction:(NSString *)function;
- (BOOL)isFilterForClass:(Class)cls;
- (BOOL)isFilterForFile:(NSString *)filename;
- (BOOL)isFilterForLine:(NSInteger)line;
- (BOOL)isFilterForIdentifier:(NSString *)identifier;

/// Except

- (BOOL)isExceptForFunction:(NSString *)function;
- (BOOL)isExceptForClass:(Class)cls;
- (BOOL)isExceptForFile:(NSString *)filename;
- (BOOL)isExceptForLine:(NSInteger)line;
- (BOOL)isExceptForIdentifier:(NSString *)identifier;

@end
