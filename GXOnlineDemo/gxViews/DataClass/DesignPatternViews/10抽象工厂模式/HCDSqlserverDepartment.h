//
//  HCDSqlserverDepartment.h
//  10抽象工厂模式
//
//  Created by yifan on 15/8/14.
//  Copyright (c) 2015年 黄成都. All rights reserved.
//
// 为创建一组相关或相互依赖的对象提供一个接口，而且无需指定他们的具体类。
#import <Foundation/Foundation.h>
#import "HCDDepartment.h"
@interface HCDSqlserverDepartment : NSObject<HCDDepartment>

@end
