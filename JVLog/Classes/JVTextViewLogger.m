//
//  JVTextViewLogger.m
//  JVLog
//
//  Created by liu on 16/4/16.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVTextViewLogger.h"

@interface JVTextViewLogger ()

@property (assign, nonatomic) UITextView *textView;

@end

@implementation JVTextViewLogger

- (id)initWithTextView:(UITextView *)textView {
    self = [super init];
    if (self) {
        self.textView = textView;
    }
    return self;
}

#pragma mark - JVLoggerProtocol

- (void)outputLog:(NSString *)log {
    if ([NSThread currentThread] == [NSThread mainThread]) {
        self.textView.text = [self.textView.text stringByAppendingString:log];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = [self.textView.text stringByAppendingString:log];
        });
    }
}

@end
