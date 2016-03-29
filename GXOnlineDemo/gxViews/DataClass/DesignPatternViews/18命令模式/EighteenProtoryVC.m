//
//  EighteenProtoryVC.m
//  GXOnlineDemo
//
//  Created by Gx on 16/3/9.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "EighteenProtoryVC.h"
#import "HCDWaiter.h"
#import "HCDCustomr.h"
#import "HCDWorker.h"

@interface EighteenProtoryVC ()

@end

@implementation EighteenProtoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDWaiter *waiter = [[HCDWaiter alloc]init];
    HCDCustomr *customer = [[HCDCustomr alloc]init];
    [waiter addOrder:[customer pushOrderWithString:@"十串羊肉" type:YES]];
    HCDCustomr *customer1 = [[HCDCustomr alloc]init];
    [waiter addOrder:[customer1 pushOrderWithString:@"二十串鸡肉" type:NO]];
    [waiter notifyOrder];
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
