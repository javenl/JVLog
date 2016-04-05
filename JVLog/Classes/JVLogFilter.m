//
//  JVLogFilter.m
//  JVLog
//
//  Created by liu on 16/4/4.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVLogFilter.h"

@interface JVLogFilter ()

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

- (void)addFilterFiles:(NSArray *)files {
    [self.fileFilters addObjectsFromArray:files];
}

- (void)addFilterClasses:(NSArray *)clses {
    [self.classFilters addObjectsFromArray:clses];
}

- (void)addFilterFunctions:(NSArray *)functions {
    [self.functionFilters addObjectsFromArray:functions];
}

- (void)addFilterLines:(NSArray *)lines {
    [self.lineFilters addObjectsFromArray:lines];
}

- (void)addFilterIdentifiers:(NSArray *)identifiers {
    [self.identifierFilters addObjectsFromArray:identifiers];
}

- (void)removeFilterFile:(NSString *)file {
    NSMutableArray *fileFilters = self.fileFilters;
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < fileFilters.count; i++) {
        NSString *f = fileFilters[i];
        if ([f isEqualToString:file]) {
            [indexSets addIndex:i];
        }
    }
    [fileFilters removeObjectsAtIndexes:indexSets];
}

- (void)removeFilterClass:(Class)cls {
    NSMutableArray *clsFilters = self.classFilters;
    NSString *clsName = NSStringFromClass(cls);
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < clsFilters.count; i++) {
        Class c = clsFilters[i];
        if ([NSStringFromClass(c) isEqualToString:clsName]) {
            [indexSets addIndex:i];
        }
    }
    [clsFilters removeObjectsAtIndexes:indexSets];
}

- (void)removeFilterFunction:(NSString *)function {
    NSMutableArray *functionFilters = self.functionFilters;
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < functionFilters.count; i++) {
        NSString *f = functionFilters[i];
        if ([f isEqualToString:function]) {
            [indexSets addIndex:i];
        }
    }
    [functionFilters removeObjectsAtIndexes:indexSets];
}

- (void)removeFilterLine:(NSInteger)line {
    NSMutableArray *lineFilters = self.lineFilters;
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < lineFilters.count; i++) {
        NSNumber *l = lineFilters[i];
        if (l.integerValue == line) {
            [indexSets addIndex:i];
        }
    }
    [lineFilters removeObjectsAtIndexes:indexSets];
}

- (void)removeFilterIdentifier:(NSString *)identifier {
    NSMutableArray *identifierFilters = self.identifierFilters;
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < identifierFilters.count; i++) {
        NSString *f = identifierFilters[i];
        if ([f isEqualToString:identifier]) {
            [indexSets addIndex:i];
        }
    }
    [identifierFilters removeObjectsAtIndexes:indexSets];
}

#pragma mark - Except

- (void)addExceptFiles:(NSArray *)files {
    [self.fileExcepts addObjectsFromArray:files];
}

- (void)addExceptClasses:(NSArray *)clses {
    [self.classExcepts addObjectsFromArray:clses];
}

- (void)addExceptFunctions:(NSArray *)functions {
    [self.functionExcepts addObjectsFromArray:functions];
}

- (void)addExceptLines:(NSArray *)line {
    [self.lineExcepts addObjectsFromArray:line];
}

- (void)addExceptIdentifiers:(NSArray *)identifiers {
    [self.identifierExcepts addObjectsFromArray:identifiers];
}

- (void)removeExceptFile:(NSString *)file {
    NSMutableArray *fileExcepts = self.fileExcepts;
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < fileExcepts.count; i++) {
        NSString *f = fileExcepts[i];
        if ([f isEqualToString:file]) {
            [indexSets addIndex:i];
        }
    }
    [fileExcepts removeObjectsAtIndexes:indexSets];
}

- (void)removeExceptClass:(Class)cls {
    NSMutableArray *classExcepts = self.classExcepts;
    NSString *clsName = NSStringFromClass(cls);
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < classExcepts.count; i++) {
        Class c = classExcepts[i];
        if ([NSStringFromClass(c) isEqualToString:clsName]) {
            [indexSets addIndex:i];
        }
    }
    [classExcepts removeObjectsAtIndexes:indexSets];
}

- (void)removeExceptFunction:(NSString *)function {
    NSMutableArray *functionExcepts = self.functionExcepts;
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < functionExcepts.count; i++) {
        NSString *f = functionExcepts[i];
        if ([f isEqualToString:function]) {
            [indexSets addIndex:i];
        }
    }
    [functionExcepts removeObjectsAtIndexes:indexSets];
}

- (void)removeExceptLine:(NSInteger)line {
    NSMutableArray *lineFilters = self.lineExcepts;
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < lineFilters.count; i++) {
        NSNumber *l = lineFilters[i];
        if (l.integerValue == line) {
            [indexSets addIndex:i];
        }
    }
    [lineFilters removeObjectsAtIndexes:indexSets];
}

- (void)removeExceptIdentifier:(NSString *)identifier {
    NSMutableArray *identifierExcepts = self.identifierExcepts;
    NSMutableIndexSet *indexSets = [NSMutableIndexSet indexSet];
    for (int i = 0; i < identifierExcepts.count; i++) {
        NSString *f = identifierExcepts[i];
        if ([f isEqualToString:identifier]) {
            [indexSets addIndex:i];
        }
    }
    [identifierExcepts removeObjectsAtIndexes:indexSets];
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
