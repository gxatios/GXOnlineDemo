
//
//  SeventeenProtoryViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 16/3/9.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "SeventeenProtoryViewController.h"
#import "HCDPhone.h"
#import "HCDNokiaPhone.h"
#import "HCDSonyPhone.h"
#import "HCDSoftware.h"
#import "HCDGameSoftware.h"
#import "HCDGameNokiaSoftware.h"
#import "HCDAddressListSofeware.h"

typedef id<HCDSoftware> HCDSoftware;
@interface SeventeenProtoryViewController ()

@end

@implementation SeventeenProtoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDPhone *phone = [[HCDNokiaPhone alloc]init];
    HCDSoftware software = [[HCDGameNokiaSoftware alloc]init];
    [phone setSoftWare:software];
    [phone playSoftPhone];
    software = [[HCDAddressListSofeware alloc]init];
    [phone setSoftWare:software];
    [phone playSoftPhone];
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
