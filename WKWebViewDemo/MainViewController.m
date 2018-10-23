//
//  MainViewController.m
//  WKWebViewDemo
//
//  Created by fwzhou on 2018/10/23.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "TestViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIButton *btnVC;
@property (nonatomic, strong) UIButton *btnWKVC;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.btnVC.frame = CGRectMake(100, 200, 100, 50);
    
    self.btnWKVC.frame = CGRectMake(100, 300, 100, 50);
}

- (void)btnVCTapped
{
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btnWKVCTapped
{
    TestViewController *vc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)btnVC
{
    if (!_btnVC) {
        _btnVC = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnVC setTitle:@"测试1" forState:UIControlStateNormal];
        [_btnVC setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_btnVC addTarget:self action:@selector(btnVCTapped) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnVC];
    }
    return _btnVC;
}

- (UIButton *)btnWKVC
{
    if (!_btnWKVC) {
        _btnWKVC = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnWKVC setTitle:@"测试2" forState:UIControlStateNormal];
        [_btnWKVC setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_btnWKVC addTarget:self action:@selector(btnWKVCTapped) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnWKVC];
    }
    return _btnWKVC;
}

@end
