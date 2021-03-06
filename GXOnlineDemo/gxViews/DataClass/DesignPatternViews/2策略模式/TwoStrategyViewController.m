//
//  TwoStrategyViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 15/12/23.
//  Copyright © 2015年 xin gao. All rights reserved.
//

#import "TwoStrategyViewController.h"
#import "HCDCashContext.h"
#import "HCDCashNormal.h"
#import "HCDCashRobate.h"
#import "HCDCaseReturn.h"

#import "Gx_Two_Create.h"
#import "Gx_Two_Add.h"
#import "Gx_Two_Multi.h"
#import "Gx_Two_Main.h"

@interface TwoStrategyViewController ()

@end

@implementation TwoStrategyViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDCashContext *context = [[HCDCashContext alloc]initWithCashType:CashTypeNormal];
    NSLog(@"结果是%f",[context getResult:100]);
    
    HCDCashContext *contextReturn = [[HCDCashContext alloc]initWithCashType:CashTypeReturn];
    NSLog(@"结果是%f",[contextReturn getResult:100]);
    
    HCDCashContext *contextRobate = [[HCDCashContext alloc]initWithCashType:CashTypeRobate];
    NSLog(@"结果是%f",[contextRobate getResult:100]);
    
    Gx_Two_Main *mainTest = [[Gx_Two_Main alloc] initWithGxType:Gx_Two_Type_Add];
    Gx_Two_Main *mainTest2 = [[Gx_Two_Main alloc] initWithGxType:Gx_Two_Type_Multi];
    NSLog(@"add:%f",[mainTest getResult:7]);
    NSLog(@"multi:%f",[mainTest2 getResult:7]);
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
