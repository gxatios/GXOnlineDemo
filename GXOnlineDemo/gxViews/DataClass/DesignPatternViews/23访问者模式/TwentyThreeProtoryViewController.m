//
//  TwentyThreeProtoryViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 16/3/9.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "TwentyThreeProtoryViewController.h"
#import "HCDObjectStructure.h"
#import "HCDConcreteElementB.h"
#import "HCDConcreteElementA.h"
#import "HCDConcreteVisitor1.h"
#import "HCDConcreteVisitor2.h"

@interface TwentyThreeProtoryViewController ()

@end

@implementation TwentyThreeProtoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDObjectStructure *o = [[HCDObjectStructure alloc]init];
    
    HCDConcreteElementA *eA = [HCDConcreteElementA new];
    
    HCDConcreteElementB *eB = [HCDConcreteElementB new];
    
    [o attach:eA];
    
    [o attach:eB];
    
    HCDConcreteVisitor1
    *v1 = [HCDConcreteVisitor1 new];
    
    HCDConcreteVisitor2
    *v2 = [HCDConcreteVisitor2 new];
    
    [o accept: v1];
    
    [o accept: v2];
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
