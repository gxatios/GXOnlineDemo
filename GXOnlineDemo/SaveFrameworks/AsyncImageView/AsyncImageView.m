//
//  AsyncImageView.m
//  Postcard
//
//  Created by markj on 2/18/09.
//  Copyright 2009 Mark Johnson. You have permission to copy parts of this code into your own projects for any use.
//  www.markj.net
//

#import "AsyncImageView.h"
#import "UIImage+Scale.h"
#import "UIImageHelper.h"
#import "Utilities.h"
#import <QuartzCore/QuartzCore.h>
#import "Reachability.h"

// This class demonstrates how the URL loading system can be used to make a UIView subclass
// that can download and display an image asynchronously so that the app doesn't block or freeze
// while the image is downloading. It works fine in a UITableView or other cases where there
// are multiple images being downloaded and displayed all at the same time. 

@implementation AsyncImageView

@synthesize isLoaded;
@synthesize isAcceptTouch;
@synthesize notificationName;
@synthesize imageView;
@synthesize imageSavePath;
@synthesize failLoadImageNameString;
@synthesize delegate;
@synthesize touchTag;
@synthesize connection;
@synthesize imageUrl;

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		//self.backgroundColor = [UIColor darkGrayColor];
	}
	
	self.isLoaded = NO;
    self.isAcceptTouch = YES;//是否接受点击事件
    UIImageView * tempImageView = [[UIImageView alloc] initWithFrame:self.frame];
	self.imageView = tempImageView;
    [tempImageView release];
    
    [self addSubview:imageView];
	
	//imageView.contentMode = UIViewContentModeScaleAspectFit;
	imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;//旋转时会拉伸view充满宽高
	imageView.frame = self.bounds;
	[imageView setNeedsLayout];
	
	return self;
}

- (void)dealloc {
    [indicatorView stopAnimating];
    [notificationName release];
    [failLoadImageNameString release];
    [imageSavePath release];
	[indicatorView release];
	[imageView release];
	[connection cancel]; //in case the URL is still downloading
	[connection release];
	[data release];
    [imageUrl release];
    [super dealloc];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self setBackgroundColor:[UIColor lightGrayColor]];
//    [self setAlpha:0.5f];
//    imageView.highlighted = YES;
//    imageView.alpha = 1.0f;
    
    if (delegate && [delegate respondsToSelector:@selector(touchAsyncImageView:)]){
        [delegate touchAsyncImageView:self];
    }
}
 


//点击异步加载的图片
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self setBackgroundColor:[UIColor clearColor]];
//    [self setAlpha:1.0f];
//    imageView.highlighted = NO;
//    imageView.alpha = 1.0f;
    
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{
//    float leftX = self.frame.origin.x;
//    float rightX = self.frame.origin.x + self.frame.size.width;
//    float topY = self.frame.origin.y;
//    float buttomY = self.frame.origin.y + self.frame.size.height;
//    
//    if (point.x>leftX && point.x<rightX && point.y>topY && point.y<buttomY) {
//        return self.isAcceptTouch;
//    }else{
//        return NO;
//    }
//}

//设置提醒
- (void)remindMeWithNotificationName:(AsyncImageView *)asyncImageView
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:self.notificationName object:asyncImageView];
}

- (void)setDefaultImageNameString:(NSString *)defaultImageString
{
    UIImage * img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:defaultImageString ofType:nil]];
    [imageView setImage:img];
    [img release];
    
}

- (void)loadImageFromURL:(NSURL*)url {
	//if (connection!=nil) { [connection release]; } //in case we are downloading a 2nd image
	//if (data!=nil) { [data release]; }
	NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    NSURLConnection *connect =[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [self.connection cancel];
	self.connection = connect; //notice how delegate set to self object
    [request release];
    [connect release];
	//TODO error handling, what if connection is nil?	
	[self.connection start];
    
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        //没有网络，邮件：关于无网络情况下 图片加载圈 依然在的处理情况
    }
    else{
        //加载条
        CGRect rect = CGRectMake(self.frame.size.width/2-30/2,self.frame.size.height/2-30/2, 30, 30);
        indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:rect];
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
//        indicatorView.center = self.center;
        [self addSubview:indicatorView];
        [indicatorView startAnimating];
    }
}

- (void)loadImageFromURLString:(NSString *)string1 {
	
    NSString *string = [string1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    self.imageUrl=string;
    
    
    NSString * md5String = [NSString stringWithFormat:@"%@",[UtilityHelper md5:string]];//转化为md5字符串，作为图片的文件名字
    NSString * firstFolderString = [md5String substringWithRange:NSMakeRange(0, 1)];//第一级目录名称
    NSString * secondFolderString = [md5String substringWithRange:NSMakeRange(1, 1)];//第二级目录名称
    NSString * thirdFolderString = [md5String substringWithRange:NSMakeRange(2, 1)];//第三级目录名称
    NSString * fielsFolderNameString = [NSString stringWithFormat:@"/img/%@/%@/%@",firstFolderString,secondFolderString,thirdFolderString];//三级目录的路径
    //首先检测图片是否存在
    
    NSString * documentPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    
    NSString * imagePath = [[NSString alloc] initWithFormat:@"%@",[[documentPath stringByAppendingPathComponent:fielsFolderNameString] stringByAppendingPathComponent:md5String]];
    //NSLog(@"取图片网址:%@",imagePath);
    //UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
    UIImage * image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    [imagePath release];
    if (image == nil) {
        //建立一个用于存储图片的文件夹
        
        [[NSFileManager defaultManager] createDirectoryAtPath:[NSString stringWithFormat:@"%@%@", documentPath,fielsFolderNameString] withIntermediateDirectories:YES attributes:nil error:nil];
        //没有图片
        //将文件名保存，用来存储图片
        NSString *path = [[NSString alloc] initWithFormat:@"%@",[[documentPath stringByAppendingPathComponent:fielsFolderNameString] stringByAppendingPathComponent:md5String]];
        self.imageSavePath = path;
        [path release];
        //NSLog(@"存储文件夹:%@",imageSavePath);
        //建立图片请求
        NSString *URLString = [NSString stringWithFormat:@"%@",string];
        URLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];	
        NSURL *URL = [NSURL URLWithString:URLString];
        [self loadImageFromURL:URL];
    }else{
        //图片存在,则直接赋值
        //NSLog(@"图片存在");
        [self.imageView setImage:image];
        if ([self.notificationName length]>0) {
            [self remindMeWithNotificationName:self];//提醒加载成功
        }
    }
    [image release];
}

- (void)loadImageFromURLString:(NSString *)string andPath:(NSString *)path
{
    NSString *URLString = [NSString stringWithFormat:@"%@",string];
	URLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];	
	NSURL *URL = [NSURL URLWithString:URLString];
	[self loadImageFromURL:URL];
    self.imageSavePath = path;
    
    
}

//the URL connection calls this repeatedly as data arrives
- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {	
	if (data==nil) { data = [[NSMutableData alloc] initWithCapacity:2048]; } 
	[data appendData:incrementalData];
    self.isLoaded = YES;
}

//the URL connection calls this once all the data has downloaded
- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
	//so self data now has the complete image 
	[connection release];
	connection=nil;
	if ([[self subviews] count]>0) {
		//then this must be another image, the old one is still in subviews
		[[[self subviews] objectAtIndex:0] removeFromSuperview]; //so remove it (releases it also)
	}
	
	//make an image view for the image
	UIImage *remoteImage = [[UIImage alloc] initWithData:data];//[UIImage imageWithData:data];//获得图片
	// imageView.image = [UIImage getRectImageFromImage:remoteImage withRect:self.frame];
	// imageView.image = [UIImage scaleImage:remoteImage toSize:self.frame.size];
	//remoteImage = [remoteImage aspectScaleToSize:self.frame.size];//采用合适尺寸		
	//imageView.image = [UIImage getRectImageFromImage:remoteImage withRect:self.frame];//这句是加上外框
    imageView.image = remoteImage;
    [remoteImage release];
	self.isLoaded = NO;
    if ([self.notificationName length]>0) {
        [self remindMeWithNotificationName:self];//提醒加载成功
    }

    //save image
    
    [data writeToFile:imageSavePath atomically:YES];

	//make sizing choices based on your needs, experiment with these. maybe not all the calls below are needed.
	
    [self addSubview:imageView];
    [imageView setNeedsDisplay];
	[self setNeedsLayout];
	
	[data release]; //don't need this any more, its in the UIImageView now
	data=nil;
	if (indicatorView) {
        [indicatorView stopAnimating];
    }
    
    if (self.tag == 234234) {
//        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"RefreshImageViewNotification" object:self]];
        [self bubbleImageViewFrame:remoteImage];
    }
    if (self.tag == 555555) {
        [self.delegate finishAsync];
    }
}

- (void)bubbleImageViewFrame:(UIImage *)remoteImage
{
    CGFloat messageLabelWidth = 100;
    CGFloat messageLabelHeight = 100;
    float h;
    CGFloat imageWidth = remoteImage.size.width;
    CGFloat imageHeight = remoteImage.size.height;
    
    if (self.superview.frame.origin.x == 55) {
        for (UIView *view in self.superview.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"UIImageView")]) {
                if (imageWidth <= imageHeight) {
                    h = messageLabelHeight * (imageWidth/imageHeight);
                    view.frame = CGRectMake(0, 0, h+15, messageLabelHeight+10);
                    self.frame = CGRectMake(10, 5, h, messageLabelHeight);
                    self.superview.frame = CGRectMake(15, 5, h+15, messageLabelHeight+20);
                }
                else {
                    h = messageLabelWidth * (imageHeight/imageWidth);
                    view.frame = CGRectMake(0, 0, messageLabelWidth+15, h+10);
                    self.frame = CGRectMake(10, 5, messageLabelWidth, h);
                    self.superview.frame = CGRectMake(15, 5, messageLabelWidth+15, h+20);
                }
//                if (imageWidth <= imageHeight) {
//                    view.frame = CGRectMake(0, 0, imageWidth+15, imageHeight+10);
//                    self.frame = CGRectMake(10, 5, imageWidth, imageHeight);
//                    self.superview.frame = CGRectMake(15, 5, imageWidth+15, imageHeight+20);
//                }
//                else {
//                    view.frame = CGRectMake(0, 0, imageWidth+15, imageHeight+10);
//                    self.frame = CGRectMake(10, 5, imageWidth, imageHeight);
//                    self.superview.frame = CGRectMake(15, 5, imageWidth+15, imageHeight+20);
//                }
            }
        }
    }
    else {
        for (UIView *view in self.superview.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"UIImageView")]) {
                if (imageWidth <= imageHeight) {
                    h = messageLabelWidth * (imageWidth/imageHeight);
                    view.frame = CGRectMake(20, 0, h+15, messageLabelHeight+10);
                    self.frame = CGRectMake(25, 5, h, messageLabelHeight);
                    self.superview.frame = CGRectMake(285-h-15, 5, h+35, messageLabelHeight+20);
                }
                else {
                    h = messageLabelHeight * (imageHeight/imageWidth);
                    view.frame = CGRectMake(20, 0, messageLabelWidth+15, h+10);
                    self.frame = CGRectMake(25, 5, messageLabelWidth, h);
                    self.superview.frame = CGRectMake(285-messageLabelWidth-15, 5, messageLabelWidth+35, h+20);
                }
//                if (imageWidth <= imageHeight) {
//                    view.frame = CGRectMake(20, 0, h+15, imageHeight+10);
//                    self.frame = CGRectMake(25, 5, h, imageHeight);
//                    self.superview.frame = CGRectMake(285-h-15, 5, h+35, imageHeight+20);
//                }
//                else {
//                    view.frame = CGRectMake(20, 0, imageWidth+15, imageHeight+10);
//                    self.frame = CGRectMake(25, 5, imageWidth, imageHeight);
//                    self.superview.frame = CGRectMake(285-imageWidth-15, 5, imageWidth+35, imageHeight+20);
//                }
            }
        }
    }
    [self.delegate tableViewScrollToBottom];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	//NSLog(@"fail connection: %@",error);
    //imageView.image = [UIImage getRectImageFromImage:[UIImage imageNamed:failLoadImageNameString] withRect:self.frame];
    UIImage * img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:failLoadImageNameString ofType:nil]];
    imageView.image = img;
    [img release];
    if ([self.notificationName length]>0) {
        [self remindMeWithNotificationName:nil];//提醒加载成功
    }
   
    if (data != nil) {
       [data release]; //don't need this any more, its in the UIImageView now
        data=nil;
    }
    if (indicatorView) {
        [indicatorView stopAnimating];
    }
}

//just in case you want to get the image directly, here it is in subviews
- (UIImage*) image {
	return imageView.image;
}
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if(indicatorView)
    {
        indicatorView.center=CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    }
}
@end