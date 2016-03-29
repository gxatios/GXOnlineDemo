//
//  TwentyProtoryViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 16/3/9.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "TwentyProtoryViewController.h"
#import "HCDColleagueA.h"
#import "HCDColleagueB.h"
#import "HCDAbstractMediator.h"
#import "HCDMediator.h"

@interface TwentyProtoryViewController ()

@end

@implementation TwentyProtoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDAbstractColleague *colleagueA = [[HCDColleagueA alloc]init];
    HCDAbstractColleague *colleagueB = [[HCDColleagueB alloc]init];
    
    HCDAbstractMediator *mediator = [[HCDMediator alloc]initWithColleagueA:colleagueA colleagueB:colleagueB];
    colleagueA.mediator = mediator;
    colleagueB.mediator = mediator;
    
    colleagueA.number = 1450;
    colleagueB.number = 1450;
    [colleagueA notice];
    NSLog(@"%f---%f",colleagueA.number,colleagueB.number);
    colleagueB.number = 123;
    [colleagueB notice];
    NSLog(@"%f---%f",colleagueA.number,colleagueB.number);
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
