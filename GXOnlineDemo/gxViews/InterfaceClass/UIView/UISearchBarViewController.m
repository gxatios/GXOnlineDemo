//
//  UISearchBarViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UISearchBarViewController.h"

@interface UISearchBarViewController () <UISearchBarDelegate>
{
    UISearchBar *_gxSearchBar;
}
@end

@implementation UISearchBarViewController

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
    self.title = @"UISearchBar";
	// Do any additional setup after loading the view.
    
    _gxSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,65, 320, 35)];
    _gxSearchBar.delegate = self;
    _gxSearchBar.barStyle = UISearchBarStyleDefault;
    _gxSearchBar.placeholder = @"gx search";
    _gxSearchBar.showsBookmarkButton = YES;
//    _gxSearchBar.showsCancelButton = YES;
    _gxSearchBar.showsSearchResultsButton = YES;
    _gxSearchBar.tintColor = [UIColor purpleColor];
    _gxSearchBar.barTintColor = [UIColor orangeColor];
    [self.view addSubview:_gxSearchBar];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
