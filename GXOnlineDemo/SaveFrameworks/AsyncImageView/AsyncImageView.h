//
//  AsyncImageView.h
//  Postcard
//
//  Created by markj on 2/18/09.
//  Copyright 2009 Mark Johnson. You have permission to copy parts of this code into your own projects for any use.
//  www.markj.net
//

#import <UIKit/UIKit.h>

@protocol AsyncImageViewDelegate <NSObject>
-(void)touchAsyncImageView:(id)sender;//点击异步加载的图片
-(void)tableViewScrollToBottom;
-(void)finishAsync;
@end

@interface AsyncImageView : UIView<NSURLConnectionDataDelegate> {
	//could instead be a subclass of UIImageView instead of UIView, depending on what other features you want to 
	// to build into this class?
	BOOL isLoaded;
    NSString * notificationName;//提醒的名称
	UIImageView *imageView;
	NSURLConnection* connection; //keep a reference to the connection so we can cancel download in dealloc
	NSMutableData* data; //keep reference to the data so we can collect it as it downloads
	//but where is the UIImage reference? We keep it in self.subviews - no need to re-code what we have in the parent class	
	UIActivityIndicatorView *indicatorView;
    NSString * imageSavePath;
    NSString * failLoadImageNameString;
    id <AsyncImageViewDelegate> delegate;
    
    NSInteger touchTag;
    
    BOOL isAcceptTouch;//default is YES //经4.1测试阶段验证，存在列表的cell不能点和详情页偶数页图片不能点的bug，目前作废
    NSString * imageUrl;
}

@property (nonatomic, assign) BOOL isLoaded;
@property (nonatomic, assign) BOOL isAcceptTouch;//是否接受点击事件
@property (nonatomic, retain) NSString * notificationName;
@property (nonatomic, assign) NSInteger touchTag;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) NSString * imageSavePath;
@property (nonatomic, retain) NSString * failLoadImageNameString;
@property (nonatomic, assign) id <AsyncImageViewDelegate> delegate;
@property (nonatomic, retain) NSURLConnection* connection;
@property (nonatomic,retain)NSString * imageUrl;
- (id)initWithFrame:(CGRect)frame;
- (void)loadImageFromURL:(NSURL*)url;
- (void)loadImageFromURLString:(NSString *)string1;
- (void)loadImageFromURLString:(NSString *)string andPath:(NSString *)path;
- (UIImage*)image;
- (void)setDefaultImageNameString:(NSString *)defaultImageString;

@end