//
//  JVTextViewLogger.h
//  JVLog
//
//  Created by liu on 16/4/16.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVBaseLogger.h"
#import "JVLoggerProtocol.h"

@interface JVTextViewLogger : JVBaseLogger <JVLoggerProtocol>

- (id)initWithTextView:(UITextView *)textView;

@end
