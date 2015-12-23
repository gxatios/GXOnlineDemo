//
//  MyCollectionCell.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-22.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "MyCollectionCell.h"

@implementation MyCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
        self.titleLabel.text = @"my collection cell label.";
        [self addSubview:self.titleLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
