//
//  JVLogShakeListener.h
//  JVLog
//
//  Created by liu on 16/5/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const JVNotificationDidShake;

@interface JVLogShakeListener : NSObject

@property (assign, nonatomic) CGFloat shakeThreshold;

+ (JVLogShakeListener *)sharedListener;

- (void)shakeToShowLogWindow;
- (void)startListenShake;
- (void)stopListenShake;

@end
