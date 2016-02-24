//
//  Gx_Two_Main.h
//  GXOnlineDemo
//
//  Created by Gx on 16/2/23.
//  Copyright © 2016年 xin gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gx_Two_Create.h"
#import "Gx_Two_Add.h"
#import "Gx_Two_Multi.h"

typedef NS_ENUM(NSInteger,Gx_Two_Type) {
    Gx_Two_Type_Normal = 0,
    Gx_Two_Type_Add,
    Gx_Two_Type_Multi
};

@interface Gx_Two_Main : NSObject

-(instancetype) initWithGxType:(Gx_Two_Type)type;
-(CGFloat)getResult:(CGFloat)money;

@end
