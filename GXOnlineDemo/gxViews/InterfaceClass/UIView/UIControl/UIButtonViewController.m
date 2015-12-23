//
//  UIButtonViewController.m
//  GXOnlineDemo
//
//  Created by gaoxin on 13-11-20.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIButtonViewController.h"

@interface UIButtonViewController ()

@end

@implementation UIButtonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"UIButton";
	// Do any additional setup after loading the view.
    [self roundRectBtn];
    [self customBtn];
}

- (void)roundRectBtn
{
    UIButton *roundBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    roundBtn.frame = CGRectMake(10, 110, 80,40);
    [roundBtn setTitle:@"80*40" forState:UIControlStateNormal];
    [self.view addSubview:roundBtn];
    
    UIButton *round2Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    round2Btn.frame = CGRectMake(100, 110, 80, 30);
    [round2Btn setTitle:@"80*30" forState:UIControlStateNormal];
    [self.view addSubview:round2Btn];
}

- (void)customBtn
{
    UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [customBtn setFrame:CGRectMake(10, 60, 80, 40)];
    [customBtn setTitle:@"8*4CBtn" forState:UIControlStateNormal];
    [customBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [customBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [customBtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:customBtn];
    
    
    UIButton *customBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [customBtn2 setFrame:CGRectMake(100, 60, 80, 30)];
    [customBtn2 setTitle:@"8*3CBtn" forState:UIControlStateNormal];
    [customBtn2 setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:customBtn2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
