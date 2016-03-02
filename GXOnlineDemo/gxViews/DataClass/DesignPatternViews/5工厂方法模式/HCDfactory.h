//
//  HCDfactory.h
//  5工厂方法模式
//
//  Created by yifan on 15/8/12.
//  Copyright (c) 2015年 黄成都. All rights reserved.
//

// 定义了一个创建对象的接口，但由子类决定要实例化的类是哪一个。工厂方法让类把实例化推迟到子类

#import <Foundation/Foundation.h>
#import "HCDCalculate.h"
@interface HCDfactory : NSObject<HCDCalculate>
-(id<HCDCalculate>)createFactory;
@end
