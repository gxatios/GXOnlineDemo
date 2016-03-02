//
//  PrototypeTwelfthViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/29.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "PrototypeTwelfthViewController.h"
#import "HCDPlayer.h"
#import "HCDForwards.h"
#import "HCDForeignCenter.h"
#import "HCDTranslator.h"

@interface PrototypeTwelfthViewController ()

@end

@implementation PrototypeTwelfthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HCDPlayer *forward = [[HCDForwards alloc]initWithName:@"maidi"];
    [forward attack];
    [forward defense];
    HCDPlayer *foreignCenter = [[HCDTranslator alloc]initWithName:@"姚明"];
    [foreignCenter attack];
    [foreignCenter defense];
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
