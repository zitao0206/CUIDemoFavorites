//
//  CUIMultiLabelViewController.m
//  Pods
//
//  Created by zitao on 03/05/2020.
//  Copyright (c) 2020 zitao. All rights reserved.
//

#import "CUIMultiLabelViewController.h"
#import "CUIMultiLabelView.h"
#import "CommonKit.h"

@interface CUIMultiLabelViewController ()
@property (nonatomic, strong) CUIMultiLabelView *multiLabelView1;
@property (nonatomic, strong) CUIMultiLabelView *multiLabelView2;
@end

@implementation CUIMultiLabelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.multiLabelView1];
    NSArray *arr1 = [[NSArray alloc] initWithObjects:@"杭州",@"上海",@"北京", nil];
    [self.multiLabelView1 refreshDataArray:arr1];
    
    [self.view addSubview:self.multiLabelView2];
    NSArray *arr2 = [[NSArray alloc] initWithObjects:@"杭州",@"上海",@"北京",@"南京",@"乌鲁木齐",@"哈尔滨",@"合肥",@"绍兴", @"重庆", @"昆明", @"天津", nil];
    [self.multiLabelView2 refreshDataArray:arr2];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.multiLabelView1.centerX = self.view.centerX;
    self.multiLabelView1.top = 200;
    
    self.multiLabelView2.centerX = self.view.centerX;
    self.multiLabelView2.top = 250;
}

- (CUIMultiLabelView *)multiLabelView1
{
    if (!_multiLabelView1)  {
        _multiLabelView1 = [[CUIMultiLabelView alloc]initWithConfig:^(CUIMultiLabelConfig *config) {
             config.width = 0;
             config.templateLabel.textAlignment = NSTextAlignmentCenter;
             config.templateLabel.textColor = [UIColor whiteColor];
             config.templateLabel.font = [UIFont systemFontOfSize:11 weight:UIFontWeightSemibold];
             config.templateLabel.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.2];
             config.templateLabel.layer.cornerRadius = 11;
             config.templateLabel.clipsToBounds = YES;
             config.templateHeight = 22;
            config.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8];
             config.topSpace = 0;
             config.leftSpace = 0;
             config.additionalWidth = 14;
             config.numberOflines = 1;
        }];
    }
    return _multiLabelView1;
}

- (CUIMultiLabelView *)multiLabelView2
{
    if (!_multiLabelView2)  {
        _multiLabelView2 = [[CUIMultiLabelView alloc]initWithConfig:^(CUIMultiLabelConfig *config) {
             config.width = 200;
             config.templateLabel.textAlignment = NSTextAlignmentCenter;
             config.templateLabel.textColor = [UIColor whiteColor];
             config.templateLabel.font = [UIFont systemFontOfSize:11 weight:UIFontWeightSemibold];
             config.templateLabel.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.2];
             config.templateLabel.layer.cornerRadius = 11;
             config.templateLabel.clipsToBounds = YES;
             config.templateHeight = 22;
             config.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8];
             config.topSpace = 0;
             config.leftSpace = 0;
             config.additionalWidth = 14;
             config.numberOflines = 0;
        }];
    }
    return _multiLabelView2;
}

@end
