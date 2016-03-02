//
//  PrototypeThirteenViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/29.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "PrototypeThirteenViewController.h"
#import "HCDGameRoll.h"
#import "HCDGameState.h"
#import "HCDStateManager.h"

@interface PrototypeThirteenViewController ()

@end

@implementation PrototypeThirteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDGameRoll *roll = [[HCDGameRoll alloc]init];
    
    [roll getState];
    HCDGameState *state = [roll saveState];
    HCDStateManager *manager = [[HCDStateManager alloc]initWithGameState:state];
    [roll fightBoss];
    [roll getState];
    [roll rebackState:manager.gameState];
    [roll getState];
    
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
