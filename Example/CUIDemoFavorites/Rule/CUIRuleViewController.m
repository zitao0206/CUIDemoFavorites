//
//  CUIRuleViewController.m
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import "CUIRuleViewController.h"
#import <WebKit/WebKit.h>

@interface CUIRuleViewController ()
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation CUIRuleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.webView.top = 0;
    self.webView.left = 0;
}

- (WKWebView *)webView
{
    if (!_webView) {
        WKWebViewConfiguration *conf = [[WKWebViewConfiguration alloc] init];
        conf.preferences = [[WKPreferences alloc]init];
        conf.preferences.minimumFontSize = 10;
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) configuration:conf];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/zitao0206/CUIDemoFavorites/"]]];
    }
    return _webView;
}

@end
