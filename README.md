JVLog
===

* A lightweight, flexible framework for logging to replace NSLog.

* 轻量级, 灵活的Log框架，可以用来替代NSLog。

##Quick start 【快速使用】

Setup a ConsoleLogger, so that the logs can output in console.
```objectivec
JVConsoleLogger *consoleLogger = [[JVConsoleLogger alloc] init];
consoleLogger.logLevel = JVLogLevelVerbose;
[JVLogManager registerLogger:consoleLogger];
```

You can use JVLog to replace NSlog.
```
NSString *s = @"world";
JVLog(@"hello %@", s);
```


##目录

* [Setup](#setup)
    * [Pod](#setup_pod)
    * [Manually](#setup_manually)
* [Get Start](#get_start)
    * [ConsoleLogger](#define)
    * [FileLogger](#define)
    * [JVLogLevel](#define)
    * [JVLogExtraInfo](#define)
    * [LogFilter](#define)
        * [filter](#define)
            * [file](#define)
            * [class](#define)
            * [function](#define)
            * [line](#define)
            * [identifier](#define)
        * [except](#define)
    * [Some Sample](#define)
* [About【关于】](#about)
    * [Writer 【作者信息】](#writer)
    * [Issue 【任何问题】](#issue)


##<a id="setup"></a>Setup 【安装】

###<a id="setup_pod"></a>Pod 【通过pod管理】

```ruby
pod 'JVLog', '~> 0.1'
```

###<a id="setup_manually"></a>Manually 【手动管理】

1.Download the JSONModel repository as a zip file or clone it.【下载源代码】

2.Copy the JVLog/Classes into your Xcode project.【把JVLog/Classes目录中下的文件加入工程】

##<a id="get_start"></a> Get start 【使用】

##<a id="about"></a>About (关于)

###<a id="writer"></a>Writer 【作者信息】
GitHub:[Javen](https://github.com/javenl)<br>
QQ：412775083<br>
Email：412775083@qq.com<br>

###<a id="issue"></a>Issue 【任何问题】

* Communication with Email or QQ.
* If find bugs, feedback to me immediately.
* If need some feature, feedback to me.
* If some better idea, feedback to me.
* If you want contribution, Pull Requests.
<br>
<br>
* 想交流的可以加qq和发邮件
* 如果发现任何bug，希望你立即告诉我
* 希望有什么新功能，请尽管告诉我
* 如果用起来觉得那里不爽的，欢迎吐槽我
* 如果你想为贡献代码，Pull Requests即可

