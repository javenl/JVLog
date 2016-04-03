//
//  ViewController.m
//  JVLog
//
//  Created by liu on 16/4/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "ViewController.h"
#import "JVLog.h"
#import "JVFileLogger.h"
#import "JVConsoleLogger.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.btn = [[UIButton alloc] init];
    self.btn.frame = CGRectMake(20, 100, 100, 40);
    [self.btn setTitle:@"test" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(didTapTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];

    
    JVFileLogger *fileLoggeer = [[JVFileLogger alloc] init];
    JVConsoleLogger *consoleLogger = [[JVConsoleLogger alloc] init];
    [JVLog registerLogger:fileLoggeer];
    [JVLog registerLogger:consoleLogger];
    
}

- (void)didTapTest {
//    [JVLog log:@"%@", @"hello"];
//    [JVLog log:@"hello"];
//    LOG(@"hello");
//    DLog(@"1 + 1 = %@", @(1+1));
//    JVLOG(@"1 + 1 = %@", @(1+1));
//    [JVLog log:[[NSString stringWithFormat:@"[filename:%s] [function:%s] [line:%d]", __FILE__, __FUNCTION__, __LINE__] stringByAppendingFormat:@"%@", @(10)]];
    
    [JVLog log:@"hello"];
    
}

@end
