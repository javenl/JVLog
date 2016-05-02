//
//  JVControlWindow.m
//  JVLog
//
//  Created by liu on 16/5/1.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVLogControlWindow.h"
#import <UIKit/UIKit.h>
#import "JVLogWindow.h"

#define kWinWidth 50
#define kOutSideEdge 5

@interface JVLogControlWindow ()

@property (strong, nonatomic) UIButton *btn;
@property (assign, nonatomic) BOOL isMoving;

@end

@implementation JVLogControlWindow

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.btn = [[UIButton alloc] init];
        [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.btn setTitle:@"Log" forState:UIControlStateNormal];
//        self.btn.backgroundColor = [UIColor redColor];
        self.btn.backgroundColor = [UIColor colorWithRed:0x87/256.0 green:0xce/256.0 blue:0xff/256.0 alpha:0.8];
        [self.btn addTarget:self action:@selector(didDragInside:withEvent:) forControlEvents:UIControlEventTouchDragInside];
        [self.btn addTarget:self action:@selector(didTouchCancel:withEvent:) forControlEvents:UIControlEventTouchCancel];
//        [self.btn addTarget:self action:@selector(didDragEnter:withEvent:) forControlEvents:UIControlEventTouchDragEnter];
//        [self.btn addTarget:self action:@selector(didDragExit:withEvent:) forControlEvents:UIControlEventTouchDragExit];
        [self.btn addTarget:self action:@selector(didTapInside:withEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.btn.frame = self.bounds;
    self.btn.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2.0f;
}

+ (JVLogControlWindow *)sharedWindow {
    static JVLogControlWindow *win;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        win = [[JVLogControlWindow alloc] init];
        CGRect winFrame = [UIScreen mainScreen].bounds;
        win.frame = CGRectMake(CGRectGetMaxX(winFrame) - kWinWidth + kOutSideEdge , CGRectGetMaxY(winFrame) - 100, kWinWidth, kWinWidth);
        win.backgroundColor = [UIColor clearColor];
    });
    return win;
}

#pragma mark - Method

- (void)ansyncShow {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self show];
    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self show];
//    });
}

- (void)show {
    self.hidden = NO;
}

- (void)hide {
    self.hidden = YES;
}

#pragma mark - Event

- (void)didTouchCancel:(id)sender withEvent:(UIEvent *)event {
    if (self.isMoving) {
        UITouch *touch = [[event.allTouches allObjects] firstObject];
        CGPoint point = [touch locationInView:[UIApplication sharedApplication].keyWindow];
//        CGRect winFrame = [UIApplication sharedApplication].keyWindow.bounds;
        CGRect winFrame = [UIScreen mainScreen].bounds;
        CGPoint targetPoint = point;
        if (targetPoint.x > CGRectGetMaxX(winFrame) / 2.0f) {
            targetPoint.x = CGRectGetMaxX(winFrame) - kWinWidth / 2.0f + kOutSideEdge;
        } else {
            targetPoint.x = kWinWidth / 2.0f - kOutSideEdge;
        }
        
        if (targetPoint.y > CGRectGetMaxY(winFrame) - kWinWidth) {
            targetPoint.y = CGRectGetMaxY(winFrame) - kWinWidth;
        }
        if (targetPoint.y < kWinWidth) {
            targetPoint.y = kWinWidth;
        }
        
        [UIView animateWithDuration:0.2 animations:^{
            self.center = targetPoint;
        }];
    }
    self.isMoving = NO;
}

- (void)didDragInside:(id)sender withEvent:(UIEvent *)event {
    self.isMoving = YES;
    UITouch *touch = [[event.allTouches allObjects] firstObject];
    CGPoint point = [touch locationInView:[UIApplication sharedApplication].keyWindow];
    self.center = point;
    
//    self.center = targetPoint;
//    NSLog(@"targetPoint %@", NSStringFromCGPoint(targetPoint));
//    NSLog(@"%@ %@", @([event isKindOfClass:[UITouch class]]), @([event isKindOfClass:[UIEvent class]]));
//    NSLog(@"didDragInside");
}

- (void)didTapInside:(id)sender withEvent:(UIEvent *)event {
    if (self.isMoving) {
        UITouch *touch = [[event.allTouches allObjects] firstObject];
        CGPoint point = [touch locationInView:[UIApplication sharedApplication].keyWindow];
        CGRect winFrame = [UIApplication sharedApplication].keyWindow.bounds;
        CGPoint targetPoint = point;
        if (targetPoint.x > CGRectGetMaxX(winFrame) / 2.0f) {
            targetPoint.x = CGRectGetMaxX(winFrame) - kWinWidth / 2.0f + kOutSideEdge;
        } else {
            targetPoint.x = kWinWidth / 2.0f - kOutSideEdge;
        }
        if (targetPoint.y > CGRectGetMaxY(winFrame) - kWinWidth) {
            targetPoint.y = CGRectGetMaxY(winFrame) - kWinWidth;
        }
        if (targetPoint.y < kWinWidth) {
            targetPoint.y = kWinWidth;
        }
        [UIView animateWithDuration:0.2 animations:^{
            self.center = targetPoint;
        }];
    } else {
//        NSLog(@"didTap");
        [[JVLogWindow sharedWindow] toggle];
    }
    self.isMoving = NO;
}
/*
#pragma mark - Touch

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancelled");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");
}
*/
@end
