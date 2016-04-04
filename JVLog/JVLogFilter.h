//
//  JVLogFilter.h
//  JVLog
//
//  Created by liu on 16/4/4.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JVLogFilter : NSObject

@property (strong, nonatomic) NSMutableArray *functionFilters;
@property (strong, nonatomic) NSMutableArray *classFilters;
@property (strong, nonatomic) NSMutableArray *fileFilters;
@property (strong, nonatomic) NSMutableArray *lineFilters;
@property (strong, nonatomic) NSMutableArray *identifierFilters;

@property (strong, nonatomic) NSMutableArray *functionExcepts;
@property (strong, nonatomic) NSMutableArray *classExcepts;
@property (strong, nonatomic) NSMutableArray *fileExcepts;
@property (strong, nonatomic) NSMutableArray *lineExcepts;
@property (strong, nonatomic) NSMutableArray *identifierExcepts;

// Filter

- (BOOL)isFilterForFunction:(NSString *)function;

- (BOOL)isFilterForClass:(Class)cls;

- (BOOL)isFilterForFile:(NSString *)filename;

- (BOOL)isFilterForLine:(NSInteger)line;

- (BOOL)isFilterForIdentifier:(NSString *)identifier;

// Except

- (BOOL)isExceptForFunction:(NSString *)function;

- (BOOL)isExceptForClass:(Class)cls;

- (BOOL)isExceptForFile:(NSString *)filename;

- (BOOL)isExceptForLine:(NSInteger)line;

- (BOOL)isExceptForIdentifier:(NSString *)identifier;

@end
