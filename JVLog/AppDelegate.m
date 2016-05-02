//
//  AppDelegate.m
//  JVLog
//
//  Created by liu on 16/4/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "AppDelegate.h"
#import "JVLog.h"

#define XCODE_COLORS_ESCAPE_MAC @"\033["
#define XCODE_COLORS_ESCAPE_IOS @"\033["
//#define XCODE_COLORS_ESCAPE_IOS @"\xC2\xA0["

#if TARGET_OS_IPHONE
#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_IOS
#else
#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_MAC
#endif

#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [[JVLogControlWindow sharedWindow] ansyncShow];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [[JVLogControlWindow sharedWindow] show];
//    });
    
//    NSString *fileName = [NSString stringWithFormat:@"%@.log",[NSDate date]];
//    NSString *logFilePath = [DOCUMENT_PATH stringByAppendingPathComponent:fileName];
//    NSString *path = @"/Users/liu/Desktop/test.log";
//    freopen([path cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
//    
//    NSLog(@"test");
    
//    LogBlue(@"hello");
    
    /*
    char *xcode_colors = getenv("XcodeColors");
    if (xcode_colors && (strcmp(xcode_colors, "YES") == 0))
    {
        // XcodeColors is installed and enabled!
        NSLog(@"xcode_colors enable");
    } else {
        NSLog(@"xcode_colors disenable");
    }
    
    setenv("XcodeColors", "YES", 0);
    
    NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;" @"123" XCODE_COLORS_RESET);
    NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;" @"Blue text" XCODE_COLORS_RESET);
    */
    return YES;
}

@end
