//
//  TestViewController.m
//  WKWebViewDemo
//
//  Created by fwzhou on 2018/10/23.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "TestViewController.h"
#import <WebKit/WebKit.h>
#import "WKWebViewJSBridge.h"

@interface TestViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) WKWebViewJSBridge *bridge;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration*config = [[WKWebViewConfiguration alloc] init];
    // 见：https://www.jianshu.com/p/6d76bba83f94
    config.selectionGranularity = WKSelectionGranularityCharacter;
    self.wkWebView =[[WKWebView alloc] initWithFrame:self.view.frame configuration:config];
    [self.view addSubview:_wkWebView];
    _wkWebView.navigationDelegate = self;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]];
    
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:url]];
    
    self.bridge = [[WKWebViewJSBridge alloc] initWithWebView:_wkWebView];
    [self.bridge registerHandler];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"finish");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"%@", error);
}

@end
