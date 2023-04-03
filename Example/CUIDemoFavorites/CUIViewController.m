//
//  CUIViewController.m
//  CUIDemoFavorites
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import "CUIViewController.h"
#import "CUIRuleViewController.h"
#import "CUIHallListViewController.h"
#import "CUIDemoFavorites-swift.h"

@interface CUIViewController ()
@property (nonatomic, strong) UIButton *demoForSwiftBtn;
@property (nonatomic, strong) UIButton *demoForOCBtn;
@property (nonatomic, strong) UIButton *ruleBtn;

@end

@implementation CUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.demoForSwiftBtn];
    [self.demoForSwiftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    [self.view addSubview:self.demoForOCBtn];
    [self.demoForOCBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(300);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    [self.view addSubview:self.ruleBtn];
    [self.ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self.demoForOCBtn).offset(100);
          make.left.equalTo(self.view);
          make.width.equalTo(self.view);
          make.height.equalTo(@40);
    }];
}

- (void)demoForSwiftBtnClickAction
{
    CUIPlusHallListVC *vc = [[CUIPlusHallListVC alloc]init];
    vc.title = @"Demos For Swift";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)demoForOCBtnClickAction
{
    CUIHallListViewController *vc = [[CUIHallListViewController alloc]init];
    vc.title = @"Demo Backups";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)ruleBtnClickAction
{
    CUIRuleViewController *vc = [[CUIRuleViewController alloc]init];
    vc.title = @"ReadMe";
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)demoForSwiftBtn
{
    if (!_demoForSwiftBtn) {
        _demoForSwiftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _demoForSwiftBtn.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightRegular];
        [_demoForSwiftBtn setTitle:@"Demos For Swift" forState:UIControlStateNormal];
        [_demoForSwiftBtn addTarget:self action:@selector(demoForSwiftBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _demoForSwiftBtn;
}

- (UIButton *)demoForOCBtn
{
    if (!_demoForOCBtn) {
        _demoForOCBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _demoForOCBtn.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightRegular];
        [_demoForOCBtn setTitle:@"Demo Backups" forState:UIControlStateNormal];
        [_demoForOCBtn addTarget:self action:@selector(demoForOCBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _demoForOCBtn;
}

- (UIButton *)ruleBtn
{
    if (!_ruleBtn) {
        _ruleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _ruleBtn.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightRegular];
        [_ruleBtn setTitle:@"ReadMe" forState:UIControlStateNormal];
        [_ruleBtn addTarget:self action:@selector(ruleBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ruleBtn;
}

@end
