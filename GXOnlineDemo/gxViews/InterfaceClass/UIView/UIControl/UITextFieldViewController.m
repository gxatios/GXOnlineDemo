//
//  UITextFieldViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UITextFieldViewController.h"

@interface UITextFieldViewController ()
{
    UITextField *_textField;
}

@end

@implementation UITextFieldViewController

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
    self.title = @"UITextField";
	// Do any additional setup after loading the view.
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 60, 250, 40)];
    _textField.placeholder = @"text field.";
    _textField.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_textField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
