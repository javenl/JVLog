//
//  JVLogView.h
//  JVLog
//
//  Created by liu on 16/4/16.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JVShakeLogWindow : UIWindow

@property (strong, nonatomic, readonly) UITextView *textView;
@property (assign, nonatomic) CGFloat shakeThreshold;

+ (JVShakeLogWindow *)sharedWindow;
- (void)startListenShake;
- (void)stopListenShake;

@end
