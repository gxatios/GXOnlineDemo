//
//  LoadMoreTableFooterView.h
//  SinaWeiBoSDKDemo
//
//  Created by Ibokan on 12-11-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
    LoadMorePulling = 3,
    LoadMoreNormal = 4,
    LoadMoreLoading = 5,    
} LoadMoreState;
@protocol  LoadMoreTableFooterViewDelegate; 
@interface LoadMoreTableFooterView : UIView
{
    
    id _delegate;
    LoadMoreState _state;
    
    UILabel *_statusLabel;
    CALayer *_arrowImage;
    UIActivityIndicatorView *_activityView;
}

@property(nonatomic,assign) id <LoadMoreTableFooterViewDelegate> delegate;


-(void)loadMoreScrollViewDidScroll:(UIScrollView *)scrollView;

-(void)loadMoreshScrollViewDidEndDragging:(UIScrollView *)scrollView;

-(void)loadMoreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;



@end
@protocol LoadMoreTableFooterViewDelegate
- (void)loadMoreTableFooterDidTriggerRefresh:(LoadMoreTableFooterView*)view;
- (BOOL)loadMoreTableFooterDataSourceIsLoading:(LoadMoreTableFooterView*)view;

@end