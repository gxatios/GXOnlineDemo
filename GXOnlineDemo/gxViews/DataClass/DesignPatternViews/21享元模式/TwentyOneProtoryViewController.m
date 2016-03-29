//
//  TwentyOneProtoryViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 16/3/9.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "TwentyOneProtoryViewController.h"
#import "HCDWebSiteFactory.h"
#import "HCDWebSite.h"
#import "HCDConcreteWebSite.h"
#import "HCDUser.h"

typedef id<HCDWebSite> HCDWebSiteType;

@interface TwentyOneProtoryViewController ()

@end

@implementation TwentyOneProtoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HCDWebSiteFactory *facoty = [[HCDWebSiteFactory alloc]init];
    HCDWebSiteType fx = [facoty getWebSiteCategory:@"产品展示"];
    HCDUser *user = [[HCDUser alloc]init];
    user.name = @"小菜";
    [fx use:user];
    HCDWebSiteType fy = [facoty getWebSiteCategory:@"产品展示"];
    HCDUser *user1 = [[HCDUser alloc]init];
    user1.name = @"大鸟";
    [fy use:user1];
    HCDWebSiteType fz = [facoty getWebSiteCategory:@"博客"];
    HCDUser *user2 = [[HCDUser alloc]init];
    user2.name = @"咪咪";
    [fz use:user2];
    
    NSInteger count = [facoty getWebSiteCount];
    NSLog(@"个数：%d",count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
