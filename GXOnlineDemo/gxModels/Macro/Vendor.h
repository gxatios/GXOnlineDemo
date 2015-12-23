//
//  Vendor.h
//  GXOnlineDemo
//
//  Created by gaoxin on 14-3-18.
//  Copyright (c) 2014年 xin gao. All rights reserved.
//

#ifndef GXOnlineDemo_Vendor_h
#define GXOnlineDemo_Vendor_h



#endif

//------------ 下面是与项目相关的 SPCSTD -----------
//随机ID
#define RANDOM_ID [NSString getRandomId]

//appID
#define APP_ID @"SPCSTD_V_2_0_0"

//downloadFolderId
#define DOWNLOADFOLDERID [[NSUserDefaults standardUserDefaults] objectForKey:@"downLoadFolderId"]
#define ROOM_FOLDERID [[NSUserDefaults standardUserDefaults] objectForKey:@"rootFolderId"]
//背景颜色
#define BACKGROUND_COLOR [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]]
#define BACKGROUND_IMAGE [UIImage imageNamed:@"Background.png"]


//路径
#define MY_DATA_PATH [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) objectAtIndex:0] stringByAppendingPathComponent:@"GBStoreData"]

//数据库路径
#define DB_NAME @"spc"
#define DB_TYPE @"sqlite"
#define DB_VERSION 1
#define DB_PATH [MY_DATA_PATH stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",DB_NAME,DB_TYPE]]
//plist 路径

#define PLIST_NAME @"GB-Setting"
#define PLIST_TYPE @"plist"
#define PLIST_PATH [MY_DATA_PATH stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",PLIST_NAME,PLIST_TYPE]]
#define PDF_PATH(_name_) [MY_DATA_PATH stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",_name_]]


//PDF文件夹路径
//#define PDFDOCUMENTPATH [MY_DATA_PATH stringByAppendingPathComponent:@"SPCPDF"]
#define PDFDOCUMENTPATH MY_DATA_PATH

//接口
#define BASE_URL @"http://mobile.gb168.cn/Mobile_Book_Shop_New/"
//#define BASE_URL @"http://192.168.11.142:8080/Mobile_Book_Shop/"

#define RECOMMEND_URL [NSString stringWithFormat:@"%@UpInfoAction_getStdAndNewsList",BASE_URL]
#define RECOMMEND_STD_URL [NSString stringWithFormat:@"%@UpInfoAction_getStdList",BASE_URL]
#define RECOMMEND_NEW_URL [NSString stringWithFormat:@"%@UpInfoAction_getNewsList",BASE_URL]
#define INFO_STD_URL [NSString stringWithFormat:@"%@StdSearchAction_standardDetail",BASE_URL]

#define USER_REGISTER_URL [NSString stringWithFormat:@"%@UserLoginAction_register",BASE_URL]
#define USER_MODIFYINFO_URL [NSString stringWithFormat:@"%@UserLoginAction_updateUserInfor",BASE_URL]
#define USER_MODIFYKEY_URL [NSString stringWithFormat:@"%@UserLoginAction_updatePwd",BASE_URL]
#define USER_LOGIN_URL [NSString stringWithFormat:@"%@UserLoginAction_login",BASE_URL]
#define USER_CHECKUSERINFO_URL [NSString stringWithFormat:@"%@UserLoginAction_getUserInfor",BASE_URL]
#define USER_LOGOUT_URL [NSString stringWithFormat:@"%@UserLoginAction_loginOut",BASE_URL]
#define USER_GETES_URL [NSString stringWithFormat:@"%@DeviceAndAppAction_getSysDate",BASE_URL]
#define USER_DEVICE_URL [NSString stringWithFormat:@"%@DeviceAndAppAction_saveDevice",BASE_URL]
#define USER_FEEDBACK_URL [NSString stringWithFormat:@"%@FeedbackAction_saveFeedback",BASE_URL]


#define NEW_DOWN_STD_URL  [NSString stringWithFormat:@"%@StdDownloadAction_download",BASE_URL]
#define NEWS_URL @"http://gb168.cn/std/stdnews/"

//帮助文件名字
#define HELP_PDF_NAME @"使用帮助"

//当前 device ID
#define DEVICE_ID USER_DEFAULT_GET(@"deviceid")
//当前 user ID
#define USER_ID USER_DEFAULT_GET(@"userid")
//当前 Version
#define VERSION USER_DEFAULT_GET(@"version")


//数据库
#define DATABASE [DBManager getDatabase]

#define TOP_COLOR [UIColor colorWithRed:198.0/255 green:22.0/255 blue:24.0/255 alpha:1]


//1.首次启动判断：

#define First_Launched @"firstLaunch"
//2.ios7系统判断：

#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)
//3.判断是否Retina屏、是否IPhone5、是否IPad
#define isRetina ([UIScreen instancesRespondToSelector: @selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),[[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


//4.加载图片宏：

#define LOADIMAGE(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

//5.rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//6.设置颜色RGB
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//7.去除"-(id)performSelector:(SEL)aSelector withObject:(id)object;"的警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)