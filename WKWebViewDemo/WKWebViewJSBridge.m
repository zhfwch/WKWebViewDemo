//
//  WKWebViewJSBridge.m
//  TestTestTest
//
//  Created by fwzhou on 2018/10/22.
//  Copyright © 2018 433. All rights reserved.
//

#import "WKWebViewJSBridge.h"
#import <WebKit/WebKit.h>
#import "WeakScriptMessageDelegate.h"

@interface WKWebViewJSBridge ()<WKScriptMessageHandler>

@property (nonatomic, weak) WKWebView *wkWebView;

@end

@implementation WKWebViewJSBridge

- (instancetype)initWithWebView:(WKWebView *)wkWebView
{
    self = [super init];
    if (self) {
        self.wkWebView = wkWebView;
    }
    return self;
}

- (void)registerHandler
{
    [_wkWebView.configuration.userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithScripteMessageDelegate:self] name:@"umsPay"];
    [_wkWebView.configuration.userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithScripteMessageDelegate:self] name:@"umsSetUpDevice"];
    
    // 已弱引用，仍然有内存泄漏，怪异
//    [_wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"umsPay"];
//    [_wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"umsSetUpDevice"];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
}

- (void)dealloc
{
    [_wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"umsPay"];
    [_wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"umsSetUpDevice"];
}

@end
