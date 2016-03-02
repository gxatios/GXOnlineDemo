//
//  EightPrototypeVC.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/25.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "EightPrototypeVC.h"
#import "HCDPersonBuilderDirector.h"
#import "HCDPersonFatBuilder.h"
#import "HCDPersonThinBuilder.h"
#import "HCDPresionBuilder.h"

typedef id<HCDPresionBuilder> HCDPresionBuilder;

@interface EightPrototypeVC ()

@end

@implementation EightPrototypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HCDPresionBuilder builder = [[HCDPersonFatBuilder alloc]init];
    HCDPersonBuilderDirector *fatDirector = [[HCDPersonBuilderDirector alloc]initWithPersonBuilder:builder];
    [fatDirector buildPerson];
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
