//
//  NightPtototypeVC.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/25.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "NightPtototypeVC.h"
#import "HCDObserver.h"
#import "HCDNBAObserver.h"
#import "HCDStockObserver.h"
#import "HCDSecreteSubject.h"

typedef id<HCDObserver> HCDObserver;

@interface NightPtototypeVC ()

@end

@implementation NightPtototypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HCDSubject *subject = [[HCDSecreteSubject alloc]init];
    //添加三个通知对象
    HCDObserver nbaobserver = [[HCDNBAObserver alloc]init];
    [subject attach:nbaobserver];
    HCDObserver stockobserver = [[HCDStockObserver alloc]init];
    [subject attach:stockobserver];
    HCDObserver stockobserver1 = [[HCDStockObserver alloc]init];
    [subject attach:stockobserver1];
    //删除一个通知对象
    [subject detach:stockobserver];
    
    [subject notify];
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
