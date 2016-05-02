//
//  JVLogShakeListener.m
//  JVLog
//
//  Created by liu on 16/5/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVLogShakeListener.h"
#import <CoreMotion/CoreMotion.h>
#import "JVLogWindow.h"

#define kDefaultShakeThreshold 2.5f

NSString *const JVNotificationDidShake = @"JVNotificationDidshake";

@interface JVLogShakeListener ()

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (assign, nonatomic) CGFloat shakeTime;
@property (assign, nonatomic) BOOL isShowLogWindow;

@end

@implementation JVLogShakeListener

- (void)dealloc {
    [self.motionManager stopAccelerometerUpdates];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (id)init {
    self = [super init];
    if (self) {
        self.shakeThreshold = kDefaultShakeThreshold;
        
        self.motionManager = [[CMMotionManager alloc] init];
        [self.motionManager setAccelerometerUpdateInterval:0.1];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    return self;
}

#pragma mark - Notification

- (void)applicationDidEnterBackground:(NSNotification *)notification {
    [self stopListenShake];
}

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    [self startListenShake];
}

#pragma mark - Method

- (void)shakeToShowLogWindow {
    [self startListenShake];
    self.isShowLogWindow = YES;
}

- (void)startListenShake {
    if ([self.motionManager isAccelerometerAvailable]) {
        [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            
            double accelerameter = sqrt(pow(accelerometerData.acceleration.x , 2)
                                        + pow(accelerometerData.acceleration.y , 2)
                                        + pow(accelerometerData.acceleration.z , 2));

            if (accelerameter > self.shakeThreshold) {
                CGFloat currentTime = [NSDate date].timeIntervalSince1970;
                if (self.shakeTime == 0 || currentTime > self.shakeTime + 1) { // 1秒内只触发一次
                    self.shakeTime = currentTime;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[NSNotificationCenter defaultCenter] postNotificationName:JVNotificationDidShake object:self];
                        if (self.isShowLogWindow) {
                            [[JVLogWindow sharedWindow] toggle];
                        }
                    });
                }
            }
        }];
    }
}

- (void)stopListenShake {
    [self.motionManager stopAccelerometerUpdates];
    self.isShowLogWindow = NO;
}

#pragma mark - instance

+ (JVLogShakeListener *)sharedListener {
    static JVLogShakeListener *listener = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        listener = [[JVLogShakeListener alloc] init];
    });
    return listener;
}

@end
