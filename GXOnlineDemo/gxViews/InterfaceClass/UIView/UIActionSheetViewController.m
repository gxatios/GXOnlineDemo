//
//  UIActionSheetViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIActionSheetViewController.h"

@interface UIActionSheetViewController () <UIActionSheetDelegate
>

@end

@implementation UIActionSheetViewController

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
    self.title = @"UIActionSheet";
	// Do any additional setup after loading the view.
    UIButton *alertBtn = [UIButton buttonWithType:0];
    [alertBtn setTitle:@"ActionSheet show." forState:UIControlStateNormal];
    [alertBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [alertBtn setBackgroundColor:[UIColor lightGrayColor]];
    [alertBtn setFrame:CGRectMake(10, 65, 200, 40)];
    [alertBtn addTarget:self action:@selector(myActionSheetView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertBtn];
}

- (void)myActionSheetView
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"My ActionSheet" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"destructiveBtn" otherButtonTitles:@"otherButton", nil];
    actionSheet.delegate = self;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}
- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
