//
//  UILabelViewController.m
//  GXOnlineDemo
//
//  Created by gaoxin on 13-11-20.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UILabelViewController.h"

@interface UILabelViewController ()

@end

@implementation UILabelViewController

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
    self.title = @"UILabel";
	// Do any additional setup after loading the view.
    
    [self myLabel];
    
}

- (void)myLabel
{
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 80, 40)];
    myLabel.text = @"myLabel";
    [self.view addSubview:myLabel];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
