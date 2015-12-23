//
//  UIWebViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 13-11-21.
//  Copyright (c) 2013年 xin gao. All rights reserved.
//

#import "UIWebViewController.h"

@interface UIWebViewController ()<UIWebViewDelegate,UITextFieldDelegate>
{
    UIWebView *_webView;
    UITextField *_urlTextField;
    UIButton *_goBtn;
}
@end

@implementation UIWebViewController

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
    self.title = @"UIWebView";
	// Do any additional setup after loading the view.
    
    _urlTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 65, 260, 40)];
    _urlTextField.placeholder = @"输入网址";
    _urlTextField.delegate = self;
    [self.view addSubview:_urlTextField];
    _goBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _goBtn.frame = CGRectMake(270, 65, 40, 40);
    [_goBtn setTitle:@"go" forState:UIControlStateNormal];
    [_goBtn addTarget:self action:@selector(goBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_goBtn];
    

    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 105, 320, self.view.frame.size.height - 65 - 40)];
    _webView.backgroundColor = [UIColor purpleColor];
    _webView.scalesPageToFit = NO; //自动对页面进行缩放以适应屏幕
 //   _webView.detectsPhoneNumbers = YES;//自动检测网页上的电话号码，单击可以拨打
    _webView.delegate = self;
    [self.view addSubview:_webView];
    [_webView setUserInteractionEnabled:YES];
//    [self loadWebPageWithString:@"www.baidu.com"];
    
   // [_webView loadHTMLString:myHTML baseURL:[NSURL URLWithString:@"http://baidu.com"]];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 1)];
    lineView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:lineView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBtnDown
{
    [self loadWebPageWithString:_urlTextField.text];
}

- (void)loadWebPageWithString:(NSString *)_urlString
{
    //    NSString *encodedString = [_urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    NSURL *url = [NSURL URLWithString:encodedString];
 //1.   NSURL* url = [NSURL fileURLWithPath:filePath];//创建 本地 URL
    if (_urlString && _urlString.length>0) {
        // 网址判断， 正则
        NSString *tempStr = [_urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:tempStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }else{
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baidu.com"]]];
    }
    
}

#pragma mark -- webview --

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"start loading...");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"finish loading...");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString *errorStr = [error domain];
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"网址错误" message:errorStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [errorAlert show];
    NSLog(@"loading error...");
    NSLog(@"%@",error);
}

#pragma mark --

- (void)dealloc
{

}

@end
