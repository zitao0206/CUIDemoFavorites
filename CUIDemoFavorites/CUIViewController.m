//
//  CUIViewController.m
//  CUIDemoFavorites
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import "CUIViewController.h"
#import "CUIDemoFavorites-swift.h"

typedef NS_OPTIONS(NSUInteger, CustomOptions) {
    CustomOptionNone      = 0,
    CustomOptionOption1   = 1 << 0,
    CustomOptionOption2   = 1 << 1,
    CustomOptionOption3   = 1 << 2
};

@interface CustomOptionHandler : NSObject

// 添加方法，用于执行与选项相关联的代码
+ (void)performActionForOption:(CustomOptions)option;

@end

@implementation CustomOptionHandler

+ (void)performActionForOption:(CustomOptions)option {
    if (option & CustomOptionOption1) {
        // 执行与CustomOptionOption1相关的代码
        NSLog(@"Option 1 is selected.");
    }
    
    if (option & CustomOptionOption2) {
        // 执行与CustomOptionOption2相关的代码
        NSLog(@"Option 2 is selected.");
    }
    
    if (option & CustomOptionOption3) {
        // 执行与CustomOptionOption3相关的代码
        NSLog(@"Option 3 is selected.");
    }
}

@end


@interface CUIViewController ()
@property (nonatomic, strong) UIButton *customUIDemoBtn;
@property (nonatomic, strong) UIButton *demoForBackup;
@property (nonatomic, strong) UIButton *ruleBtn;

@end

@implementation CUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CustomOptions selectedOptions = CustomOptionOption1 | CustomOptionOption3;
    [CustomOptionHandler performActionForOption:selectedOptions];
    
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
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)ruleBtnClickAction
{
    CUIRuleVC *vc = [[CUIRuleVC alloc]init];
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


@end
