//
//  UIPickerViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIPickerViewController.h"

@interface UIPickerViewController () <UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIPickerView *_mainPickerView;
}
@end

@implementation UIPickerViewController

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
    self.title = @"UIPickerView";
	// Do any additional setup after loading the view.
    _mainPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 65, 320, 200)];
    _mainPickerView.delegate = self;
    _mainPickerView.dataSource = self;
    [self.view addSubview:_mainPickerView];
}

#pragma mark -- pickerView --

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 50;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"test";
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0)
{
    return @"attri test";
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UIView *pupView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    pupView.backgroundColor = [UIColor purpleColor];
    return pupView;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

#pragma mark --

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
