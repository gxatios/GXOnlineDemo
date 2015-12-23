//
//  UIDataPickerViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIDatePickerViewController.h"

@interface UIDatePickerViewController ()
{
    NSArray *_mainDataArray;
    UIDatePicker *_datePicker;
    
    UILabel *_dateLabel;
}

@end

@implementation UIDatePickerViewController

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
    self.title = @"UIDatePicker";
	// Do any additional setup after loading the view.
    
    // _datePicker.frame.size.height > 216
    _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 100, 0, 0)];
    _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    _datePicker.minuteInterval = 10;
    [self.view addSubview:_datePicker];
    [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *minDate = [dateFormatter dateFromString:@"1900-01-01 00:00:00"];
    NSDate *maxDate = [dateFormatter dateFromString:@"2099-12-12 00:00:00"];
    _datePicker.minimumDate = minDate;
    _datePicker.maximumDate = maxDate;
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 300, 300, 40)];
    _dateLabel.backgroundColor = [UIColor purpleColor];
    _dateLabel.text = [NSString stringWithFormat:@"%@",_datePicker.date];
    [self.view addSubview:_dateLabel];
}

- (void)dateChanged:(id)sender
{
    UIDatePicker *control = (UIDatePicker*)sender;
    NSDate *_date = control.date;
    
    _dateLabel.text = [NSString stringWithFormat:@"%@",_date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
