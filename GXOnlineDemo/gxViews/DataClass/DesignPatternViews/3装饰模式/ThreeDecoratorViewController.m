//
//  ThreeDecoratorViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 15/12/23.
//  Copyright © 2015年 xin gao. All rights reserved.
//

#import "ThreeDecoratorViewController.h"
#import "HCDstractCellPhone.h"
#import "HCDnokiaPhone.h"
#import "HCDdecoratorGPS.h"
#import "HCDdecoratorBluetooth.h"

@interface ThreeDecoratorViewController ()

@end

@implementation ThreeDecoratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     说明：
     HCDstractCellPhone对应图片中的Component
     HCDnokiaPhone对应图片中的ConcreteComponent
     HCDdecorator对应图片中的Decorator
     HCDdecoratorGPS对应图片中的ConcreteDecoratorA
     HCDdecoratorBluetooth对应图片中的ConcreteDecoratorB
     */
    //核心思想就是通过HCDdecorator各种子类来为HCDnokiaPhone添加各种功能。而不需要改变HCDnokiaPhone。
    //参考地址:http://www.tuicool.com/articles/jyeU3mu
    HCDstractCellPhone *phone = [[HCDnokiaPhone alloc]init];
    NSLog(@"%@",phone.callNumber);
    NSLog(@"%@",phone.sendMessage);
    
    HCDdecoratorGPS *GPS = [[HCDdecoratorGPS alloc]init];
    [GPS setComponents:phone];
    NSLog(@"%@",GPS.callNumber);
    NSLog(@"%@",GPS.sendMessage);
    
    HCDdecoratorBluetooth *bluetooth = [[HCDdecoratorBluetooth alloc] init];
    [bluetooth setComponents:phone];
    NSLog(@"%@",bluetooth.callNumber);
    NSLog(@"%@",bluetooth.sendMessage);
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
