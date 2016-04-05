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
    
    JVFileLogger *fileLoggeer = [[JVFileLogger alloc] init];
    JVConsoleLogger *consoleLogger = [[JVConsoleLogger alloc] init];
    [JVLogManager registerLogger:fileLoggeer];
    [JVLogManager registerLogger:consoleLogger];
    [JVLogManager setupLogLevel:JVLogLevelVerbose];
    
//    [JVLogManager addFilterFunctions:@[@"-[ViewController didTapTest]"]];
//    [JVLogManager addFilterLines:@[@(68)]];
//    [JVLogManager addFilterIdentifiers:@[@"javenTest3"]];
//    [JVLogManager addFilterFiles:@[@"ViewController.m"]];
//    [JVLogManager addFilterClasses:@[[ViewController class]]];
    
//    [JVLogManager addExceptFiles:@[@"ViewController"]];
//    [JVLogManager addExceptClasses:@[[ViewController class]]];
//    [JVLogManager addExceptLines:@[@(63)]];
//    [JVLogManager addExceptFunctions:@[@"-[ViewController didTapTest]"]];
//    [JVLogManager addExceptIdentifiers:@[@"javenTest2"]];
    
}

- (void)didTapTest {
    JVLogE(@"javenTest1" , @"hello %@", @(1));
    JVLogW(@"javenTest1" , @"hello %@", @(2));
    JVLogI(@"javenTest1" , @"hello %@", @(3));
    JVLogD(@"javenTest1" , @"hello %@", @(4));
    JVLogV(@"javenTest1" , @"hello %@", @(5));
    
    JVLogE(@"javenTest2" , @"hello %@", @(1));
    JVLogW(@"javenTest2" , @"hello %@", @(2));
    JVLogI(@"javenTest2" , @"hello %@", @(3));
    JVLogD(@"javenTest2" , @"hello %@", @(4));
    JVLogV(@"javenTest2" , @"hello %@", @(5));
}

- (void)didTapTest2 {
    JVLogE(@"javenTest3" , @"hello %@", @(1));
    JVLogW(@"javenTest3" , @"hello %@", @(2));
    JVLogI(@"javenTest3" , @"hello %@", @(3));
    JVLogD(@"javenTest3" , @"hello %@", @(4));
    JVLogV(@"javenTest3" , @"hello %@", @(5));
    
    JVLogE(@"javenTest4" , @"hello %@", @(1));
    JVLogW(@"javenTest4" , @"hello %@", @(2));
    JVLogI(@"javenTest4" , @"hello %@", @(3));
    JVLogD(@"javenTest4" , @"hello %@", @(4));
    JVLogV(@"javenTest4" , @"hello %@", @(5));
}



@end
