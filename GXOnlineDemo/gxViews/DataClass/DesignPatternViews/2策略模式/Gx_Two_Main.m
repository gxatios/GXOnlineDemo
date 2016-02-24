//
//  Gx_Two_Main.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/23.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "Gx_Two_Main.h"

@interface Gx_Two_Main ()
@property (nonatomic, strong) Gx_Two_Create *cashSuper;
@end

@implementation Gx_Two_Main


-(instancetype) initWithGxType:(Gx_Two_Type)type
{
    self = [super init];
    if (type == Gx_Two_Type_Normal) {
        self.cashSuper = [[Gx_Two_Create alloc] init];
    }else if (type == Gx_Two_Type_Add){
        self.cashSuper = [[Gx_Two_Add alloc] init];
    }else if (type == Gx_Two_Type_Multi){
        self.cashSuper = [[Gx_Two_Multi alloc] initWithMoneyRebate:5];
    }
    return self;
}
-(CGFloat)getResult:(CGFloat)money
{
    return [self.cashSuper acceptCash:money];
}
@end
