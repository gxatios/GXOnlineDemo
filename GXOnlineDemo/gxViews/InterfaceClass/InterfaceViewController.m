//
//  InterfaceViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-20.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "InterfaceViewController.h"
#import "UIControlViewController.h"
#import "UILabelViewController.h"
#import "UIWebViewController.h"
#import "UISearchBarViewController.h"
#import "UIImageViewController.h"
#import "UIActionSheetViewController.h"
#import "UIAlertViewController.h"
#import "UIScrollViewController.h"
#import "UIPickerViewController.h"
#import "UIProgressViewController.h"

@interface InterfaceViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mainTableView;
    NSMutableArray *_tvDataArray;
}
@end

@implementation InterfaceViewController

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
    self.title = @"UIView";
    NSLog(@"self.view: width,hight:%f,%f",myViewWidth,myViewHeight);
    NSLog(@"navigation height,tabBar height:%f,%f",myNavHeight,myTabBarHeight);
    NSLog(@"statusBar height:%f",[UIApplication sharedApplication].statusBarFrame.size.height);
    CGRect bouds = [[UIScreen mainScreen]applicationFrame];
    NSLog(@"%f,%f",bouds.size.width,bouds.size.height);
	// Do any additional setup after loading the view.
   
    // 1,数据初始化
    
    NSArray *basicArray = [NSArray arrayWithObjects:@"UIControl",@"UILabel",@"UIWebView",@"UISearchBar",@"UIImageView",@"UIActionSheet",@"UIAlertView",@"UIScrollView",@"UIPickerView",@"UIProgressView", nil];
    NSArray *expandArray = [NSArray arrayWithObjects:@"UIActivityIndicatorView",@"UINavigationBar",@"UITableViewCell",@"UIToolBar",@"UITabBar",@"UIWindow", nil];
    _tvDataArray = [[NSMutableArray alloc]initWithArray:basicArray copyItems:YES];
    [_tvDataArray addObjectsFromArray:expandArray];
    
    
    //2,界面初始化
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, myViewWidth, myViewHeight - 49 - 44)
                                                 style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [self.view addSubview:_mainTableView];
    
    //3，local record exist ，refresh UI
    
    
    //4, HTTP request,refresh UI
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- tableview --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tvDataArray.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* myCellIdentifier = @"MyCellTag";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:myCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCellIdentifier];
    }else{
        for(UIView *subView in [cell.contentView subviews]){
            [subView removeFromSuperview];
        }
    }
    cell.textLabel.text = [_tvDataArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            UIControlViewController *vc = [[UIControlViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
            case 1:
        {
            UILabelViewController *vc = [[UILabelViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            UIWebViewController *vc = [[UIWebViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            UISearchBarViewController *vc = [[UISearchBarViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            UIImageViewController *vc = [[UIImageViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            UIActionSheetViewController *vc = [[UIActionSheetViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 6:
        {
            UIAlertViewController *vc = [[UIAlertViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            UIScrollViewController *vc = [[UIScrollViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 8:
        {
            UIPickerViewController *vc = [[UIPickerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 9:
        {
            UIProgressViewController *vc = [[UIProgressViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
#pragma mark --


@end
