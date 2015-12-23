//
//  AppMacro.h
//  GXOnlineDemo
//
//  Created by gaoxin on 14-3-18.
//  Copyright (c) 2014年 xin gao. All rights reserved.
//
// app相关宏定义

#ifndef GXOnlineDemo_AppMacro_h
#define GXOnlineDemo_AppMacro_h

#define myViewWidth  self.view.frame.size.width
#define myViewHeight  self.view.frame.size.height
#define myNavHeight self.navigationController.navigationBar.frame.size.height
#define myTabBarHeight self.tabBarController.tabBar.frame.size.height
#define myBoundHeight [[UIScreen mainScreen]applicationFrame].size.height
#define myBoundWidth [[UIScreen mainScreen]applicationFrame].size.width


#endif

//IOS系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//时间戳
#define NOW_TIME (long long)[[NSDate date] timeIntervalSince1970]

#define NOW_TIME_STRING [NSString stringWithFormat:@"%lld",NOW_TIME]



//NSLog
#ifndef __OPTIMIZE__
#    define NSLog(FORMAT, ...) fprintf(stderr,"%s %d %s\t\r%s\n----------\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __FUNCTION__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#    define NSLog(...) {}
#endif


//Document路径
#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//Caches路径
#define CACHES_PATH [NSString stringWithFormat:@"%@/Library/Caches",NSHomeDirectory()]

//APP Info
#define APP_INFO_DIC [[NSBundle mainBundle] infoDictionary]
#define APP_VERSION [APP_INFO_DIC objectForKey:@"CFBundleShortVersionString"]


//NSUserDefaults
//同步
#define USER_DEFAULT_SYNCHRONIZE [[NSUserDefaults standardUserDefaults] synchronize]
//set
#define USER_DEFAULT_SET(_obj_,_key_) [[NSUserDefaults standardUserDefaults] setObject:_obj_ forKey:_key_];USER_DEFAULT_SYNCHRONIZE
//get
#define USER_DEFAULT_GET(_key_) [[NSUserDefaults standardUserDefaults] objectForKey:_key_]
//remove
#define USER_DEFAULT_REMOVE(_key_) [[NSUserDefaults standardUserDefaults] removeObjectForKey:_key_];USER_DEFAULT_SYNCHRONIZE



