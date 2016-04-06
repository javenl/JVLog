//
//  ViewController.m
//  JVLog
//
//  Created by liu on 16/4/2.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "ViewController.h"
#import "JVLog.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIButton *btn2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.btn = [[UIButton alloc] init];
    self.btn.frame = CGRectMake(20, 100, 100, 40);
    [self.btn setTitle:@"test1" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(didTapTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    self.btn2 = [[UIButton alloc] init];
    self.btn2.frame = CGRectMake(20, 150, 100, 40);
    [self.btn2 setTitle:@"test2" forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btn2 addTarget:self action:@selector(didTapTest2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn2];
    
    JVLogFilter *filter = [[JVLogFilter alloc] init];
    
    [filter addFilterFiles:@[@"ViewController.m"]];
    [filter addFilterClasses:@[[ViewController class]]];
    [filter addFilterFunctions:@[@"-[ViewController didTapTest]"]];
    [filter addFilterLines:@[@(75)]];
    [filter addFilterIdentifiers:@[@"javenTest3"]];

    [filter addExceptFiles:@[@"ViewController"]];
    [filter addExceptClasses:@[[ViewController class]]];
    [filter addExceptFunctions:@[@"-[ViewController didTapTest]"]];
    [filter addExceptLines:@[@(63)]];
    [filter addExceptIdentifiers:@[@"javenTest2"]];
    
//    [filter removeFilterFile:@"ViewController.m"];
//    [filter removeFilterClass:[ViewController class]];
//    [filter removeFilterFunction:@"-[ViewController didTapTest]"];
//    [filter removeFilterLine:75];
//    [filter removeFilterIdentifier:@"javenTest3"];
    
//    [filter removeExceptFile:@"ViewController"];
//    [filter removeExceptClass:[ViewController class]];
//    [filter removeExceptFunction:@"-[ViewController didTapTest]"];
//    [filter removeExceptLine:63];
//    [filter removeExceptIdentifier:@"javenTest2"];
    
    NSString *path = @"/Users/liu/Desktop/JVLog.log";
    JVFileLogger *fileLoggeer = [[JVFileLogger alloc] initWithLoggerPath:path];
    fileLoggeer.logLevel = JVLogLevelVerbose;
    fileLoggeer.filter = filter;
    
    JVConsoleLogger *consoleLogger = [[JVConsoleLogger alloc] init];
    consoleLogger.logLevel = JVLogLevelVerbose;
//    consoleLogger.logExtraInfo = JVLogExtraInfoNone;
    consoleLogger.filter = filter;
    
    [JVLogManager registerLogger:fileLoggeer];
    [JVLogManager registerLogger:consoleLogger];
    
}

- (void)didTapTest {
    JVLog(@"%@", @"hello");
    
    JVLogEId(@"javenTest1", @"hello %@", @(1));
    JVLogWId(@"javenTest1", @"hello %@", @(2));
    JVLogIId(@"javenTest1", @"hello %@", @(3));
    JVLogDId(@"javenTest1", @"hello %@", @(4));
    JVLogVId(@"javenTest1", @"hello %@", @(5));
    
    JVLogE(@"hello %@", @(1));
    JVLogW(@"hello %@", @(2));
    JVLogI(@"hello %@", @(3));
    JVLogD(@"hello %@", @(4));
    JVLogV(@"hello %@", @(5));
}

- (void)didTapTest2 {
//    JVLogE(@"javenTest3" , @"hello %@", @(1));
//    JVLogW(@"javenTest3" , @"hello %@", @(2));
//    JVLogI(@"javenTest3" , @"hello %@", @(3));
//    JVLogD(@"javenTest3" , @"hello %@", @(4));
//    JVLogV(@"javenTest3" , @"hello %@", @(5));
//    
//    JVLogE(@"javenTest4" , @"hello %@", @(1));
//    JVLogW(@"javenTest4" , @"hello %@", @(2));
//    JVLogI(@"javenTest4" , @"hello %@", @(3));
//    JVLogD(@"javenTest4" , @"hello %@", @(4));
//    JVLogV(@"javenTest4" , @"hello %@", @(5));
}



@end
