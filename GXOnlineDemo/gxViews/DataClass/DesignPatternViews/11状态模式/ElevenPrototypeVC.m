//
//  ElevenPrototypeVC.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/25.
//  Copyright © 2016年 xin gao. All rights reserved.
//
/*
 1. 概述
 　　当一个对象的内在状态改变时允许改变其行为，这个对象看起来像是改变了其类。
 2. 解决的问题
 　　主要解决的是当控制一个对象状态转换的条件表达式过于复杂时的情况。把状态的判断逻辑转移到表示不同的一系列类当中，可以把复杂的逻辑判断简单化
 */

#import "ElevenPrototypeVC.h"
#import "HCDWork.h"
#import "HCDNoonState.h"
#import "HCDAfternoonState.h"
#import "HCDEventState.h"
#import "HCDSleepState.h"
#import "HCDRestState.h"

@interface ElevenPrototypeVC ()

@end

@implementation ElevenPrototypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HCDWork *work = [[HCDWork alloc]init];
    [work writeProgram];
    work.state = [[HCDAfternoonState alloc]init];
    [work writeProgram];
    work.state = [[HCDEventState alloc]init];
    [work writeProgram];
    work.state = [[HCDSleepState alloc]init];
    [work writeProgram];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
