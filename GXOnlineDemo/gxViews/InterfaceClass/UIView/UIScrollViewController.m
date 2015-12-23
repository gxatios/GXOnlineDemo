//
//  UIScrollViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIScrollViewController.h"

@interface UIScrollViewController () <UIScrollViewDelegate>
{
    UIScrollView *_mainScrollView;
}
@end

@implementation UIScrollViewController

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
    self.title = @"UIScrollView";
	// Do any additional setup after loading the view.
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, 320, self.view.frame.size.height - 65-50)];
    _mainScrollView.delegate = self;
    CGSize contentSize = CGSizeMake(500, 500);
    _mainScrollView.contentSize = contentSize;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(10, 10, 10,10);
    _mainScrollView.contentInset = contentInsets;
    _mainScrollView.maximumZoomScale = 3.0f;
    _mainScrollView.minimumZoomScale = 0.5f;
    
    UIImageView *mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 500, 500)];
    mainImageView.image = [UIImage imageNamed:@"BigImage.png"];
    [_mainScrollView addSubview:mainImageView];
    
    [self.view addSubview:_mainScrollView];
}
#pragma mark -- uiscrollview --

- (void)scrollViewDidScroll:(UIScrollView *)scrollView                                          // any offset changes
{
    NSLog(@"contentOffset x is %f,y is %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2) // any zoom scale changes
{
    
}

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
{
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
{
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView   // called on finger up as we are moving
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView      // called when scroll view grinds to a halt
{
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
{
    
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView     // return a view that will be scaled. if delegate returns nil, nothing happens
{
    
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view NS_AVAILABLE_IOS(3_2) // called before the scroll view begins zooming its content
{
    
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale // scale between minimum and maximum. called after any 'bounce' animations
{
    
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView   // return a yes if you want to scroll to the top. if not defined, assumes YES
{
    
    return NO;
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView      // called when scrolling animation finished. may be called immediately if already at top
{
    
}

/*
 几个属性介绍
 
 tracking
 当 touch 后还没有拖动的时候值是YES，否则NO
 
 zoomBouncing
 当内容放大到最大或者最小的时候值是 YES，否则 NO
 
 zooming
 当正在缩放的时候值是 YES，否则 NO
 
 decelerating
 当滚动后，手指放开但是还在继续滚动中。这个时候是 YES，其它时候是 NO
 
 decelerationRate
 设置手指放开后的减速率
 
 maximumZoomScale
 一个浮点数，表示能放最大的倍数
 
 minimumZoomScale
 一个浮点数，表示能缩最小的倍数
 
 pagingEnabled
 当值是 YES 会自动滚动到 subview 的边界。默认是NO
 
 scrollEnabled
 决定是否可以滚动
 
 delaysContentTouches
 是个布尔值，当值是 YES 的时候，用户触碰开始，scroll view要延迟一会，看看是否用户有意图滚动。假如滚动了，那么捕捉 touch-down 事件，否则就不捕捉。假如值是NO，当用户触碰， scroll view 会立即触发 touchesShouldBegin:withEvent:inContentView:，默认是 YES
 
 canCancelContentTouches
 当值是 YES 的时候，用户触碰后，然后在一定时间内没有移动，scrollView 发送 tracking events，然后用户移动手指足够长度触发滚动事件，这个时候，scrollView 发送了 touchesCancelled:withEvent: 到 subview，然后 scroView 开始滚动。假如值是 NO，scrollView 发送 tracking events 后，就算用户移动手指，scrollView 也不会滚动。
 
 contentSize
 里面内容的大小，也就是可以滚动的大小，默认是0，没有滚动效果。
 
 showsHorizontalScrollIndicator
 滚动时是否显示水平滚动条
 
 showsVerticalScrollIndicator
 滚动时是否显示垂直滚动条
 
 bounces
 默认是 yes，就是滚动超过边界会反弹有反弹回来的效果。假如是 NO，那么滚动到达边界会立刻停止。
 
 bouncesZoom
 和 bounces 类似,区别在于：这个效果反映在缩放上面，假如缩放超过最大缩放，那么会反弹效果；假如是 NO，则到达最大或者最小的时候立即停止。
 
 directionalLockEnabled
 默认是 NO，可以在垂直和水平方向同时运动。当值是 YES 时，假如一开始是垂直或者是水平运动，那么接下来会锁定另外一个方向的滚动。 假如一开始是对角方向滚动，则不会禁止某个方向
 
 indicatorStyle
 滚动条的样式，基本只是设置颜色。总共3个颜色：默认、黑、白
 
 scrollIndicatorInsets
 设置滚动条的位置
 
 */


#pragma mark --
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
