//
//  CUITabSelectViewController.m
//  Pods
//
//  Created by Leon on 09/01/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUITabSelectViewController.h"
#import "CUITabSelectView.h"

@interface CUITabSelectViewController ()
@property (nonatomic, strong)CUITabSelectView *tabSelectView;
@end

@implementation CUITabSelectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tabSelectView];
    NSArray *itemArr = @[@"听听1", @"看看2", @"点唱3", @"互动4", @"心动5",@"新型6",@"新型7",@"新型8",@"新型9",@"新型10",@"新型11"];
    _tabSelectView.titles = itemArr;
    [_tabSelectView setupSelectedIndex:0 withCallBack:YES];

}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tabSelectView.top = 200;
    self.tabSelectView.centerX = self.view.centerX;
}

#pragma mark - Getters

- (CUITabSelectView *)tabSelectView
{
    if (!_tabSelectView) {
        _tabSelectView = [[CUITabSelectView alloc] initWithFrame:CGRectMake(15, 0, self.view.width - 30, 30)];
        _tabSelectView.itemColor = [[UIColor cui_colorWithHexString:@"000000"]colorWithAlphaComponent:0.6];
        _tabSelectView.itemWidth = 54;
        _tabSelectView.itemHeight = 24;
        _tabSelectView.itemFont = [UIFont boldSystemFontOfSize:13.0];
        _tabSelectView.itemTextAlignment = NSTextAlignmentCenter;
        _tabSelectView.itemBgColor = [UIColor clearColor];
        
        _tabSelectView.itemSelectedFont = [UIFont boldSystemFontOfSize:15.0];
        _tabSelectView.itemSelectedBgColor = [[UIColor cui_colorWithHexString:@"FF3A3A"]colorWithAlphaComponent:0.5];
        _tabSelectView.itemSelectedColor = [UIColor cui_colorWithHexString:@"FF3B3B"];
        _tabSelectView.itemSelectedCornerRadius = 12;
        [_tabSelectView tabSelectedCallback:^(NSUInteger idx) {
            
        }];
        
        _tabSelectView.showLineView = YES;
        _tabSelectView.lineColor = [UIColor redColor];
        _tabSelectView.lineHeight = 4;
        _tabSelectView.lineCornerRadius = 2;
        _tabSelectView.lineWidth = 18;
    }
    return _tabSelectView;
}

@end
