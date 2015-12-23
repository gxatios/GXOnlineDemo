//
//  UISwitchViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UISwitchViewController.h"

@interface UISwitchViewController ()
{
    UISwitch *_swith;
    UILabel *_showLabel;
}
@end

@implementation UISwitchViewController

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
    self.title = @"UISwitchViewController";
	// Do any additional setup after loading the view.
    _swith = [[UISwitch alloc]initWithFrame:CGRectMake(10, 80, 200, 80)];
    [_swith addTarget:self action:@selector(switchBtnChanged:) forControlEvents:UIControlEventValueChanged];
    [_swith setOnTintColor:[UIColor purpleColor]];
    [_swith setTintColor:[UIColor orangeColor]];
    [_swith setThumbTintColor:[UIColor yellowColor]];
//    [[_swith appearance] setOnImage:[UIImage imageNamed:@"gx.png"]];
    [_swith setOnImage:[UIImage imageNamed:@"gx.png"]];
    [_swith setOffImage:[UIImage imageNamed:@"gx60.png"]];
    [self.view addSubview:_swith];
    
    _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 250, 40)];
    [self.view addSubview:_showLabel];
}

- (void)switchBtnChanged:(id)sender
{
    UISwitch *switchBtn = (UISwitch *)sender;
    if (switchBtn.isOn) {
        _showLabel.text = @"开";
    }else{
        _showLabel.text = @"shutdown";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
