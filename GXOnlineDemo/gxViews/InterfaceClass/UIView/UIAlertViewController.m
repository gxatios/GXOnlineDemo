//
//  UIAlertViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIAlertViewController.h"

@interface UIAlertViewController () <UIAlertViewDelegate>

@end

@implementation UIAlertViewController

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
    self.title = @"UIAlertView";
	// Do any additional setup after loading the view.
    UIButton *alertBtn = [UIButton buttonWithType:0];
    [alertBtn setTitle:@"Alert show." forState:UIControlStateNormal];
    [alertBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [alertBtn setBackgroundColor:[UIColor lightGrayColor]];
    [alertBtn setFrame:CGRectMake(10, 65, 100, 40)];
    [alertBtn addTarget:self action:@selector(myAlertView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertBtn];
}

- (void)myAlertView
{
    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"Demo" message:nil delegate:self cancelButtonTitle:@"I See" otherButtonTitles:nil, nil];
    myAlert.delegate = self;
    [myAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
