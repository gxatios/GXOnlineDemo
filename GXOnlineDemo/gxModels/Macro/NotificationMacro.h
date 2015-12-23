//
//  NotificationMacro.h
//  GXOnlineDemo
//
//  Created by gaoxin on 14-3-18.
//  Copyright (c) 2014年 xin gao. All rights reserved.
//
// 通知相关 宏定义

#ifndef GXOnlineDemo_NotificationMacro_h
#define GXOnlineDemo_NotificationMacro_h



#endif


//注册通知
#define ADD_OBSERVER(target,_selector,_name,_obj) [[NSNotificationCenter defaultCenter] addObserver: target selector:_selector name: _name object: _obj]
//发送通知
#define POST_NOTIFICATION(_notificationName,_obj,_userInfo) [[NSNotificationCenter defaultCenter] postNotificationName:_notificationName object:_obj userInfo:_userInfo]
//移除对象所有通知
#define REMOVE_ALL_OBSERVER(_id_) [[NSNotificationCenter defaultCenter] removeObserver:_id_]
//移除对象指定通知
#define REMOVE_OBSERVER(_id_,_name_,_obj_) [[NSNotificationCenter defaultCenter] removeObserver:_id_ name:_name_ object:_obj_];