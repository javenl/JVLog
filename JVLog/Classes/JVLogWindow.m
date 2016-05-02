//
//  JVLogView.m
//  JVLog
//
//  Created by liu on 16/4/16.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "JVLogWindow.h"

@interface JVLogWindow () <UITextViewDelegate>

@property (strong, nonatomic, readwrite) UITextView *textView;
@property (assign, nonatomic) BOOL isInBottom;
@property (strong, nonatomic) UIButton *closeBtn;

@end

@implementation JVLogWindow

- (void)dealloc {
    
}

- (id)init {
    self = [super init];
    if (self) {
        self.textView = [[UITextView alloc] init];
        self.textView.editable = NO;
        self.textView.selectable = NO;
        self.textView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        self.textView.backgroundColor = [UIColor blackColor];
        self.textView.textColor = [UIColor whiteColor];
        self.textView.delegate = self;
        self.textView.showsVerticalScrollIndicator = YES;
        [self addSubview:self.textView];
        
        self.closeBtn = [[UIButton alloc] init];
        [self.closeBtn setTitle:@"Close" forState:UIControlStateNormal];
        [self.closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.closeBtn addTarget:self action:@selector(didTapClose) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.closeBtn];
        
        [self.textView addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textView.frame = self.bounds;
    self.closeBtn.frame = CGRectMake(CGRectGetMaxX(self.bounds) - 80, 0, 80, 80);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"text"]) {
        [self textViewDidChange:self.textView];
    }
}

#pragma mark - Event

- (void)didTapClose {
    [self hide];
}

#pragma mark - Method

- (void)toggle {
    if (self.hidden) {
        self.hidden = NO;
        [self scrollToTextViewBottom];
    } else {
        self.hidden = YES;
    }
}

- (void)show {
    self.hidden = NO;
}

- (void)hide {
    self.hidden = YES;
}

- (void)scrollToTextViewBottom {
    self.textView.contentOffset = CGPointMake(0, self.textView.contentSize.height - CGRectGetHeight(self.textView.bounds));
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (self.textView.contentOffset.y >= self.textView.contentSize.height - CGRectGetHeight(self.textView.bounds)) {
            self.isInBottom = YES;
        } else {
            self.isInBottom = NO;
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.textView.contentOffset.y >= self.textView.contentSize.height - CGRectGetHeight(self.textView.bounds)) {
        self.isInBottom = YES;
    } else {
        self.isInBottom = NO;
    }
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

+ (JVLogWindow *)sharedWindow {
    static JVLogWindow *window;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        window = [[JVLogWindow alloc] init];
    });
    return window;
}

@end
