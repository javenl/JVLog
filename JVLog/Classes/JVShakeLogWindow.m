//
//  JVLogView.m
//  JVLog
//
//  Created by liu on 16/4/16.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVShakeLogWindow.h"
#import <CoreMotion/CoreMotion.h>

#define kDefaultShakeThreshold 2.5f

@interface JVShakeLogWindow () <UITextViewDelegate>

@property (strong, nonatomic, readwrite) UITextView *textView;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property (assign, nonatomic) CGFloat shakeTime;
@property (assign, nonatomic) BOOL isInBottom;

@end

@implementation JVShakeLogWindow

- (void)dealloc {
    [self.motionManager stopAccelerometerUpdates];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    [self.textView removeObserver:self forKeyPath:@"text"];
}

- (id)init {
    self = [super init];
    if (self) {
        self.shakeThreshold = kDefaultShakeThreshold;
        
        self.motionManager = [[CMMotionManager alloc] init];
        [self.motionManager setAccelerometerUpdateInterval:0.1];
        [self startListenShake];
        
        self.textView = [[UITextView alloc] init];
        self.textView.editable = NO;
        self.textView.selectable = NO;
        self.textView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        self.textView.backgroundColor = [UIColor blackColor];
        self.textView.textColor = [UIColor whiteColor];
        self.textView.delegate = self;
        self.textView.showsVerticalScrollIndicator = YES;
        [self addSubview:self.textView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
        [self.textView addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textView.frame = self.bounds;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"text"]) {
        [self textViewDidChange:self.textView];
    }
}

#pragma mark - Notification 

- (void)applicationDidEnterBackground:(NSNotification *)notification {
    [self stopListenShake];
}

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    [self startListenShake];
}

#pragma mark - Method

- (void)didShake {
    if (!self.keyWindow) {
        [self makeKeyAndVisible];
        [self scrollToTextViewBottom];
    } else {
        [self resignKeyWindow];
        self.hidden = YES;
    }
}

- (void)scrollToTextViewBottom {
    self.textView.contentOffset = CGPointMake(0, self.textView.contentSize.height - CGRectGetHeight(self.textView.bounds));
}

#pragma mark - Public

- (void)startListenShake {
    if ([self.motionManager isAccelerometerAvailable]) {
        [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            
            double accelerameter = sqrt(pow(accelerometerData.acceleration.x , 2)
                                        + pow(accelerometerData.acceleration.y , 2)
                                        + pow(accelerometerData.acceleration.z , 2));
            
            if (accelerameter > 2.3f) {
//                NSLog(@"shake accelerameter %@", @(accelerameter));
                CGFloat currentTime = [NSDate date].timeIntervalSince1970;
                if (self.shakeTime == 0 || currentTime > self.shakeTime + 1) { // 1秒内只触发一次
                    self.shakeTime = currentTime;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self didShake];
                    });
                }
            }
        }];
    }
}

- (void)stopListenShake {
    [self.motionManager stopAccelerometerUpdates];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (self.textView.contentOffset.y >= self.textView.contentSize.height - CGRectGetHeight(self.textView.bounds)) {
            self.isInBottom = YES;
        } else {
            self.isInBottom = NO;
        }
        NSLog(@"isInBottom %@", @(self.isInBottom));
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.textView.contentOffset.y >= self.textView.contentSize.height - CGRectGetHeight(self.textView.bounds)) {
        self.isInBottom = YES;
    } else {
        self.isInBottom = NO;
    }
//    NSLog(@"scrollViewDidEndDecelerating");
//    NSLog(@"isInBottom %@", @(self.isInBottom));
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    if (self.isInBottom) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self scrollToTextViewBottom];
        });
    }
}

#pragma mark - Properties

+ (JVShakeLogWindow *)sharedWindow {
    static JVShakeLogWindow *window;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        window = [[JVShakeLogWindow alloc] init];
    });
    return window;
}

@end
