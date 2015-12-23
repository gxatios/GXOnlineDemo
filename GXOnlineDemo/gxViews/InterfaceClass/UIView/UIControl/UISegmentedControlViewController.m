//
//  UISegmentedControlViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UISegmentedControlViewController.h"

@interface UISegmentedControlViewController ()
{
    UISegmentedControl *_segmentedControl;
    
    UILabel *_showlabel;
}

@end

@implementation UISegmentedControlViewController

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
    self.title = @"UISegmentedControl";
	// Do any additional setup after loading the view.
    _segmentedControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(10, 80, 300, 40)];
    [_segmentedControl insertSegmentWithTitle:@"first" atIndex:0 animated:YES];
    [_segmentedControl insertSegmentWithTitle:@"second" atIndex:1 animated:YES];
     [_segmentedControl insertSegmentWithTitle:@"third" atIndex:2 animated:YES];
    _segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain; // 设置样式
    [_segmentedControl setSelectedSegmentIndex:0]; // 首先显示index=0的内容
    _segmentedControl.momentary = NO;   // 设置在点击后是否恢复原样
    _segmentedControl.multipleTouchEnabled = NO;  // 可触摸
    [_segmentedControl addTarget:self action:@selector(segmentedSelected:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
    
    _showlabel = [[UILabel alloc] initWithFrame:CGRectMake(30,150, 250, 40)];
    [self.view addSubview:_showlabel];
}

- (void)segmentedSelected:(id)sender
{
    UISegmentedControl *segmentControl = (UISegmentedControl*)sender;
    NSLog(@"%d",segmentControl.selectedSegmentIndex);
    _showlabel.text = [NSString stringWithFormat:@"选中了%d",segmentControl.selectedSegmentIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
