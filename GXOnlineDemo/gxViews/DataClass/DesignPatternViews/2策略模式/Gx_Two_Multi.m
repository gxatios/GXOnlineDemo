//
//  Gx_Two_Multi.m
//  GXOnlineDemo
//
//  Created by Gx on 16/2/23.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import "Gx_Two_Multi.h"

@implementation Gx_Two_Multi
-(CGFloat)acceptCash:(CGFloat)cash
{
    return _moneyRebate*cash;
}

-(instancetype)initWithMoneyRebate:(CGFloat)moneyRebate{
    self = [super init];
    if (self) {
        _moneyRebate = moneyRebate;
    }
    return self;
}


@end
