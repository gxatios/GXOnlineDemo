//
//  FourProxyViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 15/12/24.
//  Copyright © 2015年 xin gao. All rights reserved.
//

#import "FourProxyViewController.h"
#import "HCDpursuit.h"
#import "HCDproxy.h"
#import "HCDschoolGirl.h"

@interface FourProxyViewController ()

@end

@implementation FourProxyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDschoolGirl *girl = [[HCDschoolGirl alloc]init];
    girl.name = @"哈哈哈哈哈";
    HCDproxy *proxy = [[HCDproxy alloc]initWithSchoolGirl:girl];
    [proxy giveFlowers];
    [proxy giveDolls];
    [proxy giveChocolate];
    
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
