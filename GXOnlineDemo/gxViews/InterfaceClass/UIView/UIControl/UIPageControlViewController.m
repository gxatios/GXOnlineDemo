
//
//  UIPageControlViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIPageControlViewController.h"

@interface UIPageControlViewController ()
{
    UIPageControl *_pageControl;
    UILabel *_showLabel;
}
@end

@implementation UIPageControlViewController

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
    self.title = @"UIPageControl";
	// Do any additional setup after loading the view.
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(60, 100, 200, 20)];
    _pageControl.numberOfPages = 3;
    _pageControl.currentPage = 0;
    _pageControl.backgroundColor = [UIColor orangeColor];
    
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    
    _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 150, 250, 40)];
    [self.view addSubview:_showLabel];
}

- (void)changePage:(id)sender
{
    int page = _pageControl.currentPage;
    NSLog(@"page number:%d",page);
    _showLabel.text = [NSString stringWithFormat:@"滑动到%d",page];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{

}

@end
