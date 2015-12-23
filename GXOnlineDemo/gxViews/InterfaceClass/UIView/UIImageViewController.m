//
//  UIImageViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIImageViewController.h"

@interface UIImageViewController ()
{
    UIImageView *_mainImageView;
}

@end

@implementation UIImageViewController

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
    self.title = @"UIImageView";
	// Do any additional setup after loading the view.
    _mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 65, 320, 320)];
    _mainImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_mainImageView];
    
    UIButton *shotImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shotImageBtn setBackgroundColor:[UIColor purpleColor]];
    shotImageBtn.frame = CGRectMake(10, 400, 100, 40);
    [shotImageBtn setTitle:@"image get" forState:UIControlStateNormal];
    [shotImageBtn addTarget:self action:@selector(shotBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shotImageBtn];
}

- (void)shotBtnDown
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _mainImageView.image = viewImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
