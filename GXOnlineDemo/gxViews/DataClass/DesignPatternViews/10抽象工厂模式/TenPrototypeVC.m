//
//  TenPrototypeVC.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/25.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "TenPrototypeVC.h"

#import "HCDFactory.h"
#import "HCDSqlserverFactory.h"
#import "HCDAccessFactory.h"
#import "HCDDepartment.h"
#import "HCDUser.h"

#import "SQLDepartment.h"
#import "SQLUser.h"
typedef id<HCDFactory> HCDFactory;
typedef id<HCDDepartment> HCDDepartment;
typedef id<HCDUser> HCDUser;

@interface TenPrototypeVC ()

@end

@implementation TenPrototypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HCDFactory factory = [[HCDSqlserverFactory alloc]init];
    HCDDepartment department = [factory createDepartment];
    [department insertDepartment:[[SQLDepartment alloc]init]];
    [department getDepartment];
    
    HCDFactory factory1 = [[HCDAccessFactory alloc]init];
    HCDDepartment department1 = [factory1 createDepartment];
    [department1 insertDepartment:[[SQLDepartment alloc]init]];
    [department1 getDepartment];
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
