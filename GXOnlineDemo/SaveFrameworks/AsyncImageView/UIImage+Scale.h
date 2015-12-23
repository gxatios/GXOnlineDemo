//
//  UIImage+Scale.h
//  Woyi
//
//  Created by wang xuefeng on 10-7-10.
//  Copyright 2010 5Yi.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIImage (scale)

+(UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;
+(UIImage *)createRoundedRectImage:(UIImage*)image size:(CGSize)size;
+(UIImage *)getRectImageFromImage:(UIImage *)image withRect:(CGRect)rect;

@end
