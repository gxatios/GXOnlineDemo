//
//  DataViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-20.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "DataViewController.h"
#import "NSDataViewController.h"
#import "CodeBlockViewController.h"
#import "DesignPatternViewController.h"

@interface DataViewController ()
{
    UITableView *_mainTableView;
    NSArray *_mainDataArray;
}
@end

@implementation DataViewController

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
	// Do any additional setup after loading the view.
    self.title = @"数据";
    
    _mainDataArray = [[NSArray alloc] initWithObjects:@"设计模式",@"NSData",@"NSPredicate",@"block",@"筛选",@"正则",@"本地Docu", nil];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [self.view addSubview:_mainTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _mainDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellTag = @"myCellTag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellTag];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellTag];
    }else{
        for (UIView *subView in cell.contentView.subviews) {
            [subView removeFromSuperview];
        }
    }
    
    cell.textLabel.text = [_mainDataArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Data" bundle:nil];
        DesignPatternViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"DesignPatternViewController"];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        NSDataViewController *vc = [[NSDataViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2) {
        CodeBlockViewController *vc = [[CodeBlockViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
