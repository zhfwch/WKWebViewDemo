//
//  WeakScriptMessageDelegate.m
//  Vova
//
//  Created by fwzhou on 2018/10/22.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "WeakScriptMessageDelegate.h"

@interface WeakScriptMessageDelegate ()

@property (nonatomic, weak) id<WKScriptMessageHandler> scripteMessageDelegate;

@end

@implementation WeakScriptMessageDelegate

- (instancetype)initWithScripteMessageDelegate:(id<WKScriptMessageHandler>)scripteMessageDelegate
{
    self = [super init];
    if (self) {
        self.scripteMessageDelegate = scripteMessageDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    [self.scripteMessageDelegate userContentController:userContentController didReceiveScriptMessage:message];
    
}

- (void)dealloc
{
    
}

@end
