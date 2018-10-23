//
//  WKWebViewJSBridge.h
//  TestTestTest
//
//  Created by fwzhou on 2018/10/22.
//  Copyright © 2018 433. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WKWebView;

NS_ASSUME_NONNULL_BEGIN

@interface WKWebViewJSBridge : NSObject

- (instancetype)initWithWebView:(WKWebView *)wkWebView;

- (void)registerHandler;

@end

NS_ASSUME_NONNULL_END
