//
//  UISliderViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UISliderViewController.h"

@interface UISliderViewController ()
{
    UISlider *_slider;
    UILabel *_showLabel;
}
@end

@implementation UISliderViewController

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
    self.title = @"UISliderViewController";
	// Do any additional setup after loading the view.
    
    _slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 60, 300, 40)];
//    _slider.value = 1000;
    _slider.minimumValue = 1;
    _slider.maximumValue = 100;
    [_slider setMinimumValueImage:[UIImage imageNamed:@"gx"]];
    [_slider setMaximumValueImage:[UIImage imageNamed:@"gx60"]];
    [_slider addTarget:self action:@selector(sliderBtnChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    
    _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 250, 40)];
    [self.view addSubview:_showLabel];
    
    
}

- (void)sliderBtnChanged:(id)sender

{
    UISlider *sliderBtn = (UISlider *)sender;
    float vl = sliderBtn.value;
    _showLabel.text = [NSString stringWithFormat:@"滑动到%f",vl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
