//
//  JVControlWindow.h
//  JVLog
//
//  Created by liu on 16/5/1.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JVLogControlWindow : UIWindow

+ (JVLogControlWindow *)sharedWindow;

- (void)ansyncShow;
- (void)show;
- (void)hide;

@end
