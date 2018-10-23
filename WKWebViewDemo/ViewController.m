//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by fwzhou on 2018/10/23.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "WeakScriptMessageDelegate.h"

@interface ViewController ()<WKNavigationDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    WKWebViewConfiguration*config = [[WKWebViewConfiguration alloc] init];
    // 见：https://www.jianshu.com/p/6d76bba83f94
    config.selectionGranularity = WKSelectionGranularityCharacter;
    self.wkWebView =[[WKWebView alloc] initWithFrame:self.view.frame configuration:config];
    [self.view addSubview:_wkWebView];
    _wkWebView.navigationDelegate = self;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]];
    
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:url]];
    
    // WKScriptMessageHandler内存泄漏 见：https://www.jianshu.com/p/6ba2507445e4
    [_wkWebView.configuration.userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithScripteMessageDelegate:self] name:@"umsPay"];
    [_wkWebView.configuration.userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithScripteMessageDelegate:self] name:@"umsSetUpDevice"];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"finish");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"%@", error);
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
}

- (void)dealloc
{
    // 移除WKScriptMessageHandler
    [_wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"umsPay"];
    [_wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"umsSetUpDevice"];
}

@end
