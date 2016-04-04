//
//  JVLogFilter.m
//  JVLog
//
//  Created by liu on 16/4/4.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVLogFilter.h"

@interface JVLogFilter ()

@end

@implementation JVLogFilter

- (id)init {
    self = [super init];
    if (self) {
        self.functionFilters = [NSMutableArray array];
        self.classFilters = [NSMutableArray array];
        self.fileFilters = [NSMutableArray array];
        self.lineFilters = [NSMutableArray array];
        self.identifierFilters = [NSMutableArray array];
        
        self.functionExcepts = [NSMutableArray array];
        self.classExcepts = [NSMutableArray array];
        self.fileExcepts = [NSMutableArray array];
        self.lineExcepts = [NSMutableArray array];
        self.identifierExcepts = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Filter

- (BOOL)isFilterForFunction:(NSString *)function {
    for (NSString *f in self.functionFilters) {
        if ([f isEqualToString:function]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isFilterForClass:(Class)cls {
    NSString *clsName = NSStringFromClass(cls);
    for (Class c in self.classFilters) {
        if ([NSStringFromClass(c) isEqualToString:clsName]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isFilterForFile:(NSString *)filename {
    for (NSString *f in self.fileFilters) {
        if ([f isEqualToString:f]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isFilterForLine:(NSInteger)line {
    for (NSNumber *f in self.lineFilters) {
        if ([f integerValue] == line) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isFilterForIdentifier:(NSString *)identifier {
    for (NSString *i in self.identifierFilters) {
        if ([i isEqualToString:identifier]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - Except

- (BOOL)isExceptForFunction:(NSString *)function {
    for (NSString *f in self.functionExcepts) {
        if ([f isEqualToString:function]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isExceptForClass:(Class)cls {
    NSString *clsName = NSStringFromClass(cls);
    for (Class c in self.classExcepts) {
        if ([NSStringFromClass(c) isEqualToString:clsName]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isExceptForFile:(NSString *)filename {
    for (NSString *f in self.fileExcepts) {
        if ([f isEqualToString:f]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isExceptForLine:(NSInteger)line {
    for (NSNumber *f in self.lineExcepts) {
        if ([f integerValue] == line) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isExceptForIdentifier:(NSString *)identifier {
    for (NSString *i in self.identifierExcepts) {
        if ([i isEqualToString:identifier]) {
            return YES;
        }
    }
    return NO;
}

@end
