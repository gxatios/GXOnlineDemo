//
//  SixPrototypeVC.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/25.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "SixPrototypeVC.h"
#import "HCDtextPaper.h"
#import "HCDtextPaperA.h"
#import "HCDtextPaperB.h"
@interface SixPrototypeVC ()

@end

@implementation SixPrototypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDtextPaper *paperA = [[HCDtextPaperA alloc]init];
    [paperA testQuestion1];
    [paperA testQuestion2];
    
    HCDtextPaper *paperB = [[HCDtextPaperB alloc]init];
    [paperB testQuestion1];
    [paperB testQuestion2];
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
