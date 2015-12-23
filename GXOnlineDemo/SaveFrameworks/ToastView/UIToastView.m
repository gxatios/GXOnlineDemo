//
//  NeighborToastView.m
//  iphone_neighbor
//
//  Created by 孟庆宇 on 11-12-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIToastView.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIToastView
@synthesize toastView;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)dealloc
{
    [toastView release];
    [super dealloc];
}


+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController
{
    UIImageView * toastView = [[UIImageView alloc] initWithFrame:rect];
    
    if ([UIImage imageNamed:@"toastBackImage.png"]) {
        [toastView setImage:[[UIImage imageNamed:@"toastBackImage.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
    }else{
        [toastView setBackgroundColor:[UIColor blackColor]];
    }
    
    [toastView.layer setCornerRadius:5.0f];
    [toastView.layer setMasksToBounds:YES];
    [toastView setAlpha:1.0f];
    [toastView setTag:1234554321];
    [selfController.view addSubview:toastView];
    [toastView release];
    
    CGSize labelSize = [content sizeWithFont:[UIFont systemFontOfSize:17.0f]
                           constrainedToSize: CGSizeMake( rect.size.width ,MAXFLOAT)
                               lineBreakMode: UILineBreakModeWordWrap];
    //UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, rect.size.width-20, labelSize.height)];
    //UILabel * contentLabel = [[UILabel alloc] initWithFrame:toastView.bounds];
    if (labelSize.height > rect.size.height) {
        [toastView setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, labelSize.height)];
    }
    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, toastView.frame.size.width - 20, toastView.frame.size.height)];
    [contentLabel setText:content];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [contentLabel setTextAlignment:UITextAlignmentCenter];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [contentLabel setLineBreakMode:UILineBreakModeWordWrap];
    [toastView addSubview:contentLabel];
    [contentLabel release];
    
    if (time>0.01) {
        [self performSelector:@selector(removeToastView:) withObject:selfController afterDelay:time];
    }

}

+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController andHightNoLimited:(BOOL)limited
{
    UIImageView * toastView = [[UIImageView alloc] initWithFrame:rect];
    //[toastView setBackgroundColor:[UIColor blackColor]];
    
    if ([UIImage imageNamed:@"toastBackImage.png"]) {
        [toastView setImage:[[UIImage imageNamed:@"toastBackImage.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
    }else{
        [toastView setBackgroundColor:[UIColor blackColor]];
    }
    
    [toastView.layer setCornerRadius:5.0f];
    [toastView.layer setMasksToBounds:YES];
    [toastView setAlpha:1.0f];
    [toastView setTag:1234554321];
    [selfController.view addSubview:toastView];
    [toastView release];
    
    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 40)];
	
    [contentLabel setText:content];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setTextAlignment:UITextAlignmentCenter];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [toastView addSubview:contentLabel];
    [contentLabel release];
    
    
    [self performSelector:@selector(removeToastView:) withObject:selfController afterDelay:time];
}

+ (void)removeToastView:(id)sender
{
    UIViewController * selfController = (UIViewController *)sender;
    UIView * toastView = [selfController.view viewWithTag:1234554321];
    [toastView removeFromSuperview];
    toastView = nil;
    
}

@end
