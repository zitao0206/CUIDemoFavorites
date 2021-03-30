//
//  CUIViewController.m
//  CUIDemoFavorites
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUIViewController.h"
#import "CUIRuleViewController.h"
#import "CUIHallListViewController.h"

@interface CUIViewController ()
@property (nonatomic, strong) UIButton *demoBtn;
@property (nonatomic, strong) UIButton *ruleBtn;
@end

@implementation CUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.demoBtn];
    [self.demoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    [self.view addSubview:self.ruleBtn];
    [self.ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self.demoBtn).offset(100);
          make.left.equalTo(self.view);
          make.width.equalTo(self.view);
          make.height.equalTo(@40);
    }];
}

- (void)demoBtnClickAction
{
    CUIHallListViewController *vc = [[CUIHallListViewController alloc]init];
    vc.title = @"Demos";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)ruleBtnClickAction
{
    CUIRuleViewController *vc = [[CUIRuleViewController alloc]init];
    vc.title = @"入库方法";
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)demoBtn
{
    if (!_demoBtn) {
        _demoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_demoBtn setTitle:@"Demos" forState:UIControlStateNormal];
        [_demoBtn addTarget:self action:@selector(demoBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _demoBtn;
}

- (UIButton *)ruleBtn
{
    if (!_ruleBtn) {
        _ruleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_ruleBtn setTitle:@"入库方法" forState:UIControlStateNormal];
        [_ruleBtn addTarget:self action:@selector(ruleBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ruleBtn;
}

@end
