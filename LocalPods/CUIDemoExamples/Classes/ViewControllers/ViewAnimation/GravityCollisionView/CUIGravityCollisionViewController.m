//
//  GravityViewController.m
//  Pods
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUIGravityCollisionViewController.h"
#import "CUISenderGravityCollisionView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface CUIGravityCollisionViewController ()<CUISenderGravityCollisionViewDelegate>

@property (nonatomic, strong) CUISenderGravityCollisionView *gravityView;

@property (nonatomic, strong) UIButton *gravityViewBtn;

@end

@implementation CUIGravityCollisionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.gravityView];

    [self.view addSubview:self.gravityViewBtn];
}

- (CUISenderGravityCollisionView *)gravityView
{
    if (!_gravityView) {
        _gravityView = [[CUISenderGravityCollisionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _gravityView.delegate = self;
    }
    return _gravityView;
}

- (UIButton *)gravityViewBtn
{
    CGSize size = self.view.bounds.size;
    if (!_gravityViewBtn) {
        _gravityViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(size.width - 65, size.height - 55, 60, 50)];
        _gravityViewBtn.backgroundColor = [UIColor blackColor] ;
        [_gravityViewBtn setTitle:@"发射台" forState:UIControlStateNormal];
        [_gravityViewBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _gravityViewBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_gravityViewBtn addTarget:self action:@selector(beginClick) forControlEvents:UIControlEventTouchDown];
        [_gravityViewBtn addTarget:self action:@selector(endClick) forControlEvents:UIControlEventTouchCancel];
        [_gravityViewBtn addTarget:self action:@selector(endClick) forControlEvents:UIControlEventTouchUpInside];
        [_gravityViewBtn addTarget:self action:@selector(endClick) forControlEvents:UIControlEventTouchUpOutside];
    }
    return _gravityViewBtn;
}


- (void)setupGravityItemBeginPosition
{
    //心心的起始发射坐标
    CGPoint startPoint = self.gravityViewBtn.origin;
    if (startPoint.x == 0 || startPoint.y == 0) {
        return;
    }
    [self.gravityView setupItemBeginPosition:startPoint];
}

- (void)beginClick
{
    [self setupGravityItemBeginPosition];
    [self.gravityView beginClick:YES];
}

- (void)endClick
{
   [self.gravityView endClick];
}

#pragma mark -- CUIGravityCollisionViewDelegate

- (void)numberOfClicked:(NSInteger)count
{
    NSLog(@"------->共计发射%@次",@(count));
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]]; 
    [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"共计发射%@次",@(count)]];
    [SVProgressHUD dismissWithDelay:2.0f];
}

- (void)numberOfConcurrentClicked:(NSInteger)count
{
    
}

- (void)senderViewWillBeHidden
{
    
}

@end
