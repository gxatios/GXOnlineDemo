//
//  SevenPrototypeVC.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/25.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "SevenPrototypeVC.h"
#import "HCDFound.h"
@interface SevenPrototypeVC ()

@end

@implementation SevenPrototypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDFound *found = [[HCDFound alloc]init];
    [found buyFund];
    [found sellFund];
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
