//
//  FiveFactoryViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 15/12/24.
//  Copyright © 2015年 xin gao. All rights reserved.
//

#import "FiveFactoryViewController.h"
#import "HCDCalculate.h"
#import "HCDfactory.h"
#import "HCDCalculateAdd.h"
#import "HCDfactoryAdd.h"

@interface FiveFactoryViewController ()

@end

@implementation FiveFactoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDfactory *factory = [[HCDfactoryAdd alloc]init];
    HCDfactory  *calculate = [factory createFactory];
    calculate.numberA = 10;
    calculate.numberB = 15;
    NSLog(@"结果是%f",[calculate calculate]);
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
