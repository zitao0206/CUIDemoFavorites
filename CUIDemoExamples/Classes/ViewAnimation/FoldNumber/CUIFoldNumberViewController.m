//
//  CUIFoldNumberViewController.m
//  CUIUIKit
//
//  Created by Leon on 03/05/2020.
//  Copyright (c) 2020 Leon. All rights reserved.
//

#import "CUIFoldNumberViewController.h"
#import "CUIFoldNumberView.h"
#import <Masonry/Masonry.h>

@interface CUIFoldNumberViewController ()
@property (nonatomic, strong) CUIFoldNumberView *foldNumber1;
@property (nonatomic, strong) CUIFoldNumberView *foldNumber2;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger number;
@end

@implementation CUIFoldNumberViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.foldNumber1 = [[CUIFoldNumberView alloc]initWithConfig:^(CUIFoldNumberConfig *config) {
        config.backgroundColor = [UIColor redColor];
        config.textColor = [UIColor blackColor];
        config.labelBgColor = [UIColor lightGrayColor];
        config.places = 10;
        config.labelSize = CGSizeMake(30, 30);
        config.labelMargin = 5;
        config.changeMode = CUIFoldNumberMeanwhileMode;
    }];
    [self.view addSubview:self.foldNumber1];
    
    self.foldNumber2 = [[CUIFoldNumberView alloc]initWithConfig:^(CUIFoldNumberConfig *config) {
        config.backgroundColor = [UIColor redColor];
        config.textColor = [UIColor blackColor];
        config.labelBgColor = [UIColor lightGrayColor];
        config.places = 0; 
        config.labelSize = CGSizeMake(30, 40);
        config.labelMargin = 5;
        config.changeMode = CUIFoldNumberRandomMode;
    }];
    [self.view addSubview:self.foldNumber2];
    self.number = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(updateNumber) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    int num1 = arc4random()%10000000000;
    _foldNumber1.numberValue = [NSString stringWithFormat:@"%i",num1];
   
}

- (void)updateNumber
{
    self.number += 500;
    _foldNumber2.numberValue = [NSString stringWithFormat:@"%@",@(self.number++)];
    self.foldNumber2.right = self.view.width - 30;
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.foldNumber1.centerX = self.view.centerX;
    self.foldNumber1.top = 300;
    
    self.foldNumber2.right = self.view.width - 30;
    self.foldNumber2.top = 380;
}

@end
