//
//  EGORefreshTableHeaderView.m
//  Demo
//
//  Created by Devin Doty on 10/14/09October14.
//  Copyright 2009 enormego. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGORefreshTableHeaderView.h"
#import "SouFunRentHouseListController.h"
#import "SouFunZFHouseListController.h"
#import "FRHomePageViewController.h"

#define TEXT_COLOR	 [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f


@interface EGORefreshTableHeaderView (Private)
- (void)setState:(EGOPullRefreshState)aState;
@end

@implementation EGORefreshTableHeaderView

@synthesize delegate=_delegate;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		self.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];

		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 20.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont systemFontOfSize:12.0f];
		label.textColor = TEXT_COLOR;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_lastUpdatedLabel=label;
		[label release];
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 40.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = TEXT_COLOR;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_statusLabel=label;
		[label release];
		
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(25.0f, frame.size.height - 40.0f, 30.0f, 35.0f);
		layer.contentsGravity = kCAGravityResizeAspect;
		layer.contents = (id)[UIImage imageNamed:@"grayArrow.png"].CGImage;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
			layer.contentsScale = [[UIScreen mainScreen] scale];
		}
#endif
		
		[[self layer] addSublayer:layer];
		_arrowImage=layer;
		
		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		view.frame = CGRectMake(30.0f, frame.size.height - 30.0f, 20.0f, 20.0f);
		[self addSubview:view];
		_activityView = view;
		[view release];
		
		
		[self setState:EGOOPullRefreshNormal];
		
    }
	
    return self;
	
}

- (void)setLastUpdatedLabelText
{
    //读取NSUserDefaults的数据，不修改数据
    NSDate *date = [_delegate egoRefreshTableHeaderDataSourceLastUpdated:self];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    if ([_delegate isKindOfClass:[SouFunRentHouseListController class]]) {
        RentRequestType rentRequestType = [_delegate rentRequestType];
        
        if (rentRequestType == RentRequestType_SHOUYE || rentRequestType == RentRequestType_SEARCH) {
            //首页
            _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次刷新时间: %@",
                                      [self lastUpdateTimeStr:[formatter stringFromDate:date]]];
        }
    }else if ([_delegate isKindOfClass:[SouFunZFHouseListController class]]) {
        
        _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次刷新时间: %@",
                                      [self lastUpdateTimeStr:[formatter stringFromDate:date]]];
    } else if ([_delegate isKindOfClass:[FRHomePageViewController class]]) {
        _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次刷新时间: %@",
                                  [self lastUpdateTimeStr:[formatter stringFromDate:date]]];
    }
    [formatter release];
}

- (void)setDelegate:(id<EGORefreshTableHeaderDelegate>)delegate
{
    _delegate = delegate;
    //首次进入
    [self setLastUpdatedLabelText];
    
}

#pragma mark -
#pragma mark Setters

- (void)refreshLastUpdatedDate {
	
	if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceLastUpdated:)]) {
		
		NSDate *date = [_delegate egoRefreshTableHeaderDataSourceLastUpdated:self];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setAMSymbol:@"AM"];
		[formatter setPMSymbol:@"PM"];
		[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        if ([_delegate isKindOfClass:[SouFunRentHouseListController class]]) {
            
            RentRequestType rentRequestType = [_delegate rentRequestType];
            
            if (rentRequestType == RentRequestType_SHOUYE) {
                //首页
                _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次刷新时间: %@",
                                          [self lastUpdateTimeStr:[formatter stringFromDate:date]]];
                [[NSUserDefaults standardUserDefaults] setObject:[formatter stringFromDate:date] forKey:@"RentHouseSHOUYE_LastRefresh"];
            }
            
            
        }else if ([_delegate isKindOfClass:[SouFunZFHouseListController class]]) {
            
            _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次刷新时间: %@",
                                      [self lastUpdateTimeStr:[formatter stringFromDate:date]]];
            
            ZFRequestType zfRequestType = [_delegate zfRequestType];
            
            if (zfRequestType == ZFRequestType_QITA) {
                [[NSUserDefaults standardUserDefaults] setObject:[formatter stringFromDate:date] forKey:@"zfHouseQITA_LastRefresh"];
            }else if (zfRequestType == ZFRequestType_TONGJIAWEI){
                [[NSUserDefaults standardUserDefaults] setObject:[formatter stringFromDate:date] forKey:@"zfHouseTONGJIAWEI_LastRefresh"];
            }
            
        }else if([_delegate isKindOfClass:[FRHomePageViewController class]]){
            _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次刷新时间: %@",
                                      [self lastUpdateTimeStr:[formatter stringFromDate:date]]];
            [[NSUserDefaults standardUserDefaults] setObject:[formatter stringFromDate:date] forKey:@"roomHomePage_LastRefresh"];
        } else {
            _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次刷新时间: %@",
                                      [formatter stringFromDate:date]];
            [[NSUserDefaults standardUserDefaults] setObject:_lastUpdatedLabel.text forKey:@"EGORefreshTableView_LastRefresh"];
        }
		
		[[NSUserDefaults standardUserDefaults] synchronize];
		[formatter release];
		
	} else {
		
		_lastUpdatedLabel.text = nil;
		
	}

}

- (void)setState:(EGOPullRefreshState)aState{
    
	switch (aState) {
            
        case  EGOOPullRefreshQiangzhi:
            _statusLabel.text = @"正在刷新";
			[_activityView startAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
			_arrowImage.hidden = YES;
			[CATransaction commit];

			break;

		case EGOOPullRefreshPulling:
			
			_statusLabel.text = @"释放立即刷新";
			[CATransaction begin];
			[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
			_arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
			[CATransaction commit];
			
			break;
		case EGOOPullRefreshNormal:
            
			if (_state == EGOOPullRefreshPulling) {
				[CATransaction begin];
				[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
				_arrowImage.transform = CATransform3DIdentity;
				[CATransaction commit];
			}
			
			_statusLabel.text = @"下拉刷新";
			[_activityView stopAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
			_arrowImage.hidden = NO;
			_arrowImage.transform = CATransform3DIdentity;
			[CATransaction commit];
			
			break;
		case EGOOPullRefreshLoading:
			
			_statusLabel.text = @"正在刷新";
			[_activityView startAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
			_arrowImage.hidden = YES;
			[CATransaction commit];
            
			break;
		default:
			break;
	}
	
	_state = aState;
    
}
-(void)setjiazai{

    [self refreshLastUpdatedDate];
    _state=EGOOPullRefreshQiangzhi;
//    _statusLabel.text = @"正在更新...";
//    [_activityView startAnimating];
//    [CATransaction begin];
//    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
//    _arrowImage.hidden = YES;
//    [CATransaction commit];
  

}

-(void)download:(UIScrollView *)scrollView
{
    _state = EGOOPullRefreshNormal;
    [self egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark ScrollView Methods

- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView {	
    
     [self setLastUpdatedLabelText];
    
	if (_state == EGOOPullRefreshLoading) {
		
		CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
		offset = MIN(offset, 40);
		scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0f, 0.0f, 0.0f);
		
	} else if (scrollView.isDragging){
		
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceIsLoading:)]) {
			_loading = [_delegate egoRefreshTableHeaderDataSourceIsLoading:self];
		}
		
		if (_state == EGOOPullRefreshPulling && scrollView.contentOffset.y > -40.0f && scrollView.contentOffset.y < 0.0f && !_loading) {
			[self setState:EGOOPullRefreshNormal];
		} else if (_state == EGOOPullRefreshNormal && scrollView.contentOffset.y < -40.0f && !_loading) {
			[self setState:EGOOPullRefreshPulling];
		}
		
		if (scrollView.contentInset.top != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
		
	}
	
}

- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
	
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceIsLoading:)]) {
		_loading = [_delegate egoRefreshTableHeaderDataSourceIsLoading:self];
	}

	
	if ((scrollView.contentOffset.y <= - 40.0f && !_loading)||_state==EGOOPullRefreshQiangzhi) {
		
		if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDidTriggerRefresh:)]) {
			[_delegate egoRefreshTableHeaderDidTriggerRefresh:self];
		}
		if (_state==EGOOPullRefreshQiangzhi) {
            [self setState:EGOOPullRefreshQiangzhi];
        }else{
            [self setState:EGOOPullRefreshLoading];
        }
        _state=EGOOPullRefreshLoading;
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
		[UIView commitAnimations];
		
	}
	
}

- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {	
	
    
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.3];
	[scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    	[scrollView setContentOffset:CGPointMake(0.0f, 0.0f)];
	[UIView commitAnimations];
	
	[self setState:EGOOPullRefreshNormal];
    [self refreshLastUpdatedDate];

}


#pragma mark -
#pragma mark Dealloc

- (void)dealloc {
	
	_delegate=nil;
	_activityView = nil;
	_statusLabel = nil;
	_arrowImage = nil;
	_lastUpdatedLabel = nil;
    [super dealloc];
}

/*
 参数:
    lastTime:上次刷新时间
 */
#pragma mark - 
#pragma mark custom methods
-(NSString *)lastUpdateTimeStr:(NSString *)nowTimeStr{
	
	int month;//year,month,day,hour,minute,second;
	int comyear,commonth,comday,comhour,commin,comsec;
	
    NSString *lastTimeStr = nil;
    if ([_delegate isKindOfClass:[SouFunRentHouseListController class]]) {
        RentRequestType rentRequestType = [_delegate rentRequestType];
        if (rentRequestType == RentRequestType_SHOUYE || rentRequestType == RentRequestType_SEARCH) {//首页
            lastTimeStr= [[NSUserDefaults standardUserDefaults] objectForKey:@"RentHouseSHOUYE_LastRefresh"];
        }
    }else if ([_delegate isKindOfClass:[SouFunZFHouseListController class]]) {
        ZFRequestType zfRequestType = [_delegate zfRequestType];
        
        if (zfRequestType == ZFRequestType_QITA) {
            lastTimeStr= [[NSUserDefaults standardUserDefaults] objectForKey:@"zfHouseQITA_LastRefresh"];

        }else if (zfRequestType == ZFRequestType_TONGJIAWEI){
            lastTimeStr= [[NSUserDefaults standardUserDefaults] objectForKey:@"zfHouseTONGJIAWEI_LastRefresh"];
        }
    }else if ([_delegate isKindOfClass:[FRHomePageViewController class]]) {
        lastTimeStr= [[NSUserDefaults standardUserDefaults] objectForKey:@"roomHomePage_LastRefresh"];
    }
    
    if (nil==lastTimeStr || [@"" isEqualToString:lastTimeStr]) {
        return [NSString stringWithFormat:@"%@",@"刚刚"];
    }
	NSArray *timeArray = [lastTimeStr componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"- :"]];
	month = [[timeArray objectAtIndex:1] intValue];
    
	//当前时间
	NSArray *nowTimeArray = [nowTimeStr componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"- :"]];
	
    //SL_Log(@"上次:%@,现在:%@",lastTimeStr,nowTimeStr);
    
	comyear =  [[nowTimeArray objectAtIndex:0] intValue]-[[timeArray objectAtIndex:0] intValue];
	commonth = [[nowTimeArray objectAtIndex:1] intValue]-[[timeArray objectAtIndex:1] intValue];
	comday = [[nowTimeArray objectAtIndex:2] intValue]-[[timeArray objectAtIndex:2] intValue];
	comhour = [[nowTimeArray objectAtIndex:3] intValue]-[[timeArray objectAtIndex:3] intValue];
	commin = [[nowTimeArray objectAtIndex:4] intValue]-[[timeArray objectAtIndex:4] intValue];
	comsec = [[nowTimeArray objectAtIndex:5] intValue]-[[timeArray objectAtIndex:5] intValue];
	
	if (comsec < 0) {
		comsec += 60;
		commin--;
	}
	if (commin < 0) {
		commin += 60;
		comhour--;
	}
	if (comhour < 0) {
		comhour += 24;
		comday--;
	}
	if (comday < 0) {
		switch (month) {
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				comday += 31;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				comday += 30;
				break;
			case 2:
				if (([[nowTimeArray objectAtIndex:0] intValue]%4&&[[nowTimeArray objectAtIndex:0] intValue]%100 )|| [[nowTimeArray objectAtIndex:0] intValue]%400 ) {
					comday += 29;
				}
				else{
					comday += 28;
				}
				break;
				
			default:
				break;
		}
		commonth--;
	}
	if (commonth < 0) {
		commonth += 12;
		comyear--;
	}
	
    if (comyear>0 || commonth>0 || comday>7) {
        return [NSString stringWithFormat:@"%@",lastTimeStr];
    }else{
        if (comday>=1) {
            return [NSString stringWithFormat:@"%d天前",comday];
        }else if(comhour >= 1){
            return [NSString stringWithFormat:@"%d小时前",comhour];
        }else if(commin >= 1){
            return [NSString stringWithFormat:@"%d分钟前",commin];
        }else{
            return [NSString stringWithFormat:@"%@",@"刚刚"];
        }
    }
		
}


@end
