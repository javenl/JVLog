//
//  JVLogView.h
//  JVLog
//
//  Created by liu on 16/4/16.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JVLogWindow : UIWindow

@property (strong, nonatomic, readonly) UITextView *textView;

+ (JVLogWindow *)sharedWindow;

- (void)show;
- (void)hide;
- (void)toggle;

@end
