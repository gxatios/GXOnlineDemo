//
//  UIImage+Scale.m
//  Woyi
//
//  Created by wang xuefeng on 10-7-10.
//  Copyright 2010 5Yi.com. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (scale)

+(UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size 
{
	// 创建一个bitmap的context
	// 并把它设置成为当前正在使用的context
	UIGraphicsBeginImageContext(size);
	
	// 绘制改变大小的图片
	[image drawInRect:CGRectMake(0, 0, size.width, size.height)];
	
	// 从当前context中创建一个改变大小后的图片
	UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	
	// 使当前的context出堆栈
	UIGraphicsEndImageContext();
	
	// 返回新的改变大小后的图片
	return scaledImage;
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,float ovalHeight)
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
		CGContextAddRect(context, rect);
		return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}


+(UIImage *) createRoundedRectImage:(UIImage*)image size:(CGSize)size
{
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
	
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, 10, 10);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *tempimage =[UIImage imageWithCGImage:imageMasked];
    CGImageRelease(imageMasked);
    return tempimage;
}


+(UIImage *)getRectImageFromImage:(UIImage *)image withRect:(CGRect)rect
{
	rect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    
    float minx = 0.0, maxx = CGRectGetMaxX(rect);
    float miny = 0.0, maxy = CGRectGetMaxY(rect);
    
    UIGraphicsBeginImageContext(CGSizeMake(maxx, maxy));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.0].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 2.0);
    
    CGContextMoveToPoint(context, minx, miny);
    CGContextAddLineToPoint(context, maxx, miny);
    CGContextAddLineToPoint(context, maxx, maxy);
    CGContextAddLineToPoint(context, minx, maxy);
    CGContextAddLineToPoint(context, minx, miny);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    float width = image.size.width > (maxx- 6.0) ? (maxx-6.0) : image.size.width;
    float heigth = image.size.height > (maxy- 6.0) ? (maxy-6.0) : image.size.height;
    
    [image drawInRect:CGRectMake(3.0, 3.0, width, heigth) ];
    //[image drawAtPoint:CGPointMake(3.0, 3.0) ];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end