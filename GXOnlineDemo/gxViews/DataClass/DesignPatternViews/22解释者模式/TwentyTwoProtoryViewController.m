//
//  TwentyTwoProtoryViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 16/3/9.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "TwentyTwoProtoryViewController.h"
#import "HCDContext.h"
#import "HCDTerminalExpression.h"
#import "HCDNonterminalExpression.h"

@interface TwentyTwoProtoryViewController ()

@end

@implementation TwentyTwoProtoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDContext *context = [[HCDContext alloc]initWithInput:@"12345"];
    NSMutableArray *list = [[NSMutableArray alloc]init];
    
    [list addObject:[[HCDTerminalExpression alloc]init]];
    
    [list addObject:[[HCDNonterminalExpression alloc]init]];
    
    [list addObject:[[HCDTerminalExpression alloc]init]];
    
    [list addObject:[[HCDTerminalExpression alloc]init]];
    
    for(HCDAbstractExpression *exp in list) {
        [exp interpret:context];
    }
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
