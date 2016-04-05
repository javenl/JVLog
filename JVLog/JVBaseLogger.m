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

//@property (strong, nonatomic) JVLogFilter *filter;

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
/*
#pragma mark - Properties

- (void)setupFilter:(JVLogFilter *)filter {
    self.filter = filter;
}

- (void)removeFilter {
    self.filter = nil;
}
*/
@end
