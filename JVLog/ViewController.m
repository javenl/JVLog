//
//  ViewController.m
//  JVLog
//
//  Created by liu on 16/4/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "ViewController.h"
#import "JVLogManager.h"
#import "JVFileLogger.h"
#import "JVConsoleLogger.h"
#import "JVLogMacros.h"

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
    [JVLogManager registerLogger:fileLoggeer];
    [JVLogManager registerLogger:consoleLogger];
    
//    [JVLog add]
    
}

- (void)didTapTest {
//    [JVLog log:@"%@", @"hello"];
//    [JVLog log:@"hello"];
//    LOG(@"hello");
//    DLog(@"1 + 1 = %@", @(1+1));
//    JVLOG(@"1 + 1 = %@", @(1+1));
//    [JVLog log:[[NSString stringWithFormat:@"[filename:%s] [function:%s] [line:%d]", __FILE__, __FUNCTION__, __LINE__] stringByAppendingFormat:@"%@", @(10)]];
//    [JVLog log:@"hello"];
//    [JVLog log:<#(NSString *)#> level:<#(JVLogLevel)#> file:<#(NSString *)#> class:<#(__unsafe_unretained Class)#> function:<#(NSString *)#> line:<#(NSInteger)#> identifier:<#(NSString *)#>]
    JVLogE(@"javenTest" , @"hello %@", @(1));
    JVLogW(@"javenTest" , @"hello %@", @(2));
    JVLogI(@"javenTest" , @"hello %@", @(3));
    JVLogD(@"javenTest" , @"hello %@", @(4));
    JVLogV(@"javenTest" , @"hello %@", @(5));
//
    
}

@end
