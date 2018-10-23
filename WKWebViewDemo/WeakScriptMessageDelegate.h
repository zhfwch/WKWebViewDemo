//
//  WeakScriptMessageDelegate.h
//  Vova
//
//  Created by fwzhou on 2018/10/22.
//  Copyright © 2018 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakScriptMessageDelegate : NSObject<WKScriptMessageHandler>

- (instancetype)initWithScripteMessageDelegate:(id<WKScriptMessageHandler>)scripteMessageDelegate;

@end

NS_ASSUME_NONNULL_END
