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
@property (nonatomic, strong) UIButton *customUIDemoBtn;
@property (nonatomic, strong) UIButton *demoForBackup;
@property (nonatomic, strong) UIButton *ruleBtn;

@end

@implementation CUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.customUIDemoBtn];
    [self.view addSubview:self.ruleBtn];
    [self.view addSubview:self.demoForBackup];
    
    [self.customUIDemoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@40);
    }];

    [self.ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(300);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@40);
    }];

    [self.demoForBackup mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self.view).offset(400);
          make.left.equalTo(self.view);
          make.width.equalTo(self.view);
          make.height.equalTo(@40);
    }];
    
    self.navigationController.navigationItem.backButtonTitle = @"";
}

- (void)customUIDemoBtnClickAction
{
    CUIPlusHallListVC *vc = [[CUIPlusHallListVC alloc]init];
    vc.title = @"CUIDemoFavorites";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)demoForBackupClickAction
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

- (UIButton *)customUIDemoBtn
{
    if (!_customUIDemoBtn) {
        _customUIDemoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _customUIDemoBtn.titleLabel.font = [UIFont systemFontOfSize:25.0 weight:UIFontWeightBold];
        [_customUIDemoBtn setTitle:@"Custom UI Demos" forState:UIControlStateNormal];
        [_customUIDemoBtn addTarget:self action:@selector(customUIDemoBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _customUIDemoBtn;
}

- (UIButton *)ruleBtn
{
    if (!_ruleBtn) {
        _ruleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _ruleBtn.titleLabel.font = [UIFont systemFontOfSize:25.0 weight:UIFontWeightBold];
        [_ruleBtn setTitle:@"ReadMe" forState:UIControlStateNormal];
        [_ruleBtn addTarget:self action:@selector(ruleBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ruleBtn;
}

- (UIButton *)demoForBackup
{
    if (!_demoForBackup) {
        _demoForBackup = [UIButton buttonWithType:UIButtonTypeSystem];
        _demoForBackup.titleLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightBold];
        _demoForBackup.titleLabel.tintColor = [UIColor lightGrayColor];
        [_demoForBackup setTitle:@"Demo Backups" forState:UIControlStateNormal];
        [_demoForBackup addTarget:self action:@selector(demoForBackupClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _demoForBackup;
}



@end
