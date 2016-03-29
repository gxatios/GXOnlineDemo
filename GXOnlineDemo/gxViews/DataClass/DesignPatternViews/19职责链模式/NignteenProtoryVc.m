//
//  NignteenProtoryVc.m
//  GXOnlineDemo
//
//  Created by Gx on 16/3/9.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "NignteenProtoryVc.h"
#import "HCDMnager.h"
#import "HCDCommonManager.h"
#import "HCDMajorManager.h"
#import "HCDGenaralManager.h"
#import "HCDReuquest.h"
@interface NignteenProtoryVc ()

@end

@implementation NignteenProtoryVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDCommonManager *common = [[HCDCommonManager alloc]initWithName:@"猪经理"];
    HCDMajorManager *majon = [[HCDMajorManager alloc]initWithName:@"狗总监"];
    HCDGenaralManager *genaral = [[HCDGenaralManager alloc]initWithName:@"蛤蟆总经理"];
    common.superior = majon;
    majon.superior = genaral;
    
    HCDReuquest *request = [[HCDReuquest alloc]init];
    request.requestType = @"请假";
    request.number = 5;
    [common dealRequest:request];
    
    request.number = 20;
    [common dealRequest:request];
    
    request.number = 220;
    [common dealRequest:request];
    
    request.number = 1200;
    [common dealRequest:request];
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
