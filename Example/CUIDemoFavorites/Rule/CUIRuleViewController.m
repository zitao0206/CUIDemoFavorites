//
//  CUIRuleViewController.m
//
//  Created by Leon0206 on 03/30/2021.
//  Copyright (c) 2021 Leon0206. All rights reserved.
//

#import "CUIRuleViewController.h"

@interface CUIRuleViewController ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *savedButton;
@end

@implementation CUIRuleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.contentLabel];
    [self.view addSubview:self.savedButton];
}

- (void)buttonAction
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.contentLabel.text;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.titleLabel sizeToFit];
    self.titleLabel.size = CGSizeMake(self.view.width, 40);
    self.titleLabel.top = 200;
    
    [self.contentLabel sizeToFit];
    self.contentLabel.size = CGSizeMake(self.view.width, 40);
    self.contentLabel.top = self.titleLabel.bottom + 30;
    
    [self.savedButton sizeToFit];
    self.savedButton.size = CGSizeMake(60, 40);
    self.savedButton.top = self.contentLabel.bottom + 10;
    self.savedButton.centerX = self.view.centerX;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blueColor];
        _titleLabel.font = [UIFont fontWithName:@"Arial"size:15.0];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = @"详细介绍在这里:";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor blueColor];
        _contentLabel.font = [UIFont fontWithName:@"Arial"size:11.0];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.text = @"";
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

- (UIButton *)savedButton
{
    if (!_savedButton) {
        _savedButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_savedButton setTitle:@"复制" forState:UIControlStateNormal];
        _savedButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_savedButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _savedButton;
}


@end
