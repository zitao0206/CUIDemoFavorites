////
////  GravityViewController.m
////  Pods
////
////  Created by zitao on 03/30/2021.
////  Copyright (c) 2021 zitao. All rights reserved.
////
//
//#import "CUIProgressCircleViewController.h"
//#import "CUIProgressCircleView.h"
//#import "CommonKit.h"
//
//@interface CUIProgressCircleViewController ()
//
//@property (nonatomic, strong) CUIProgressCircleView *progressCircleView;
//
//@end
//
//@implementation CUIProgressCircleViewController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    [self.view addSubview:self.progressCircleView];
//    
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.progressCircleView resume];
//    });
//}
//
//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    self.progressCircleView.centerX = kScreenCenterX;
//    self.progressCircleView.centerY = kScreenCenterY;
//}
//
//
//- (CUIProgressCircleView *)progressCircleView
//{
//    if (!_progressCircleView) {
//        _progressCircleView = [[CUIProgressCircleView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//        _progressCircleView.isNeedInnerTimer = YES;
//        [_progressCircleView reset];
//        _progressCircleView.progressBlock = ^(CGFloat progress) {
//            NSLog(@"progress-------->%@",@(progress));
//        };
//        _progressCircleView.backgroundColor = [UIColor lightGrayColor];
//    }
//    return _progressCircleView;
//}
//
//@end
