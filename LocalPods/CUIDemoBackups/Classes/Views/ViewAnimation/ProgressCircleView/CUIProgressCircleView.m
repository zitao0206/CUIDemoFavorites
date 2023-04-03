//
//  CUIProgressCircleView.m
//  Pods
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import "CUIProgressCircleView.h"

@interface CUIProgressCircleView ()
//进度条颜色
@property(nonatomic, strong) UIColor *progerssColor;
//进度条背景颜色
@property(nonatomic, strong) UIColor *progerssBackgroundColor;
//进度条的宽度
@property(nonatomic, assign) CGFloat progerWidth;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) BOOL isPlaying;

@end

@implementation CUIProgressCircleView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        //默认颜色
        self.progerssBackgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.1];
        self.progerssColor = [[UIColor whiteColor]colorWithAlphaComponent:0.9];
        //默认进度条宽度
        self.progerWidth = 5.0;

    }
    return self;
}

- (void)setIsNeedInnerTimer:(BOOL)isNeedInnerTimer
{
    _isNeedInnerTimer = isNeedInnerTimer;
    if (_isNeedInnerTimer) {
        [self addTimer];
    }
}

- (void)addTimer
{
//创建定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(timerCalculation) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timerCalculation
{
    if (!self.isPlaying) return;
    self.progress += 0.05;

    if (self.progressBlock) {
        self.progressBlock(self.progress);
    }
    
    if (self.progress >= 1) {
        NSLog(@"完成");
        [self stopTimer];
    }
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)resume
{
    self.isPlaying = YES;
}

- (void)stop
{
    self.isPlaying = NO;
}

- (void)reset
{
    self.progress = 0.0;
    self.isPlaying = NO;
}

- (void)drawRect:(CGRect)rect
{
    //路径
    UIBezierPath *backgroundPath = [[UIBezierPath alloc] init];
    //线宽
    backgroundPath.lineWidth = self.progerWidth;
    //颜色
    [self.progerssBackgroundColor set];
    //拐角
    backgroundPath.lineCapStyle = kCGLineCapRound;
    backgroundPath.lineJoinStyle = kCGLineJoinRound;
    //半径
    CGFloat radius = (MIN(rect.size.width, rect.size.height) - self.progerWidth) * 0.5;
    //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
    [backgroundPath addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:M_PI * 1.5 endAngle:M_PI * 1.5 + M_PI * 2  clockwise:YES];
    //连线
    [backgroundPath stroke];
    //路径
    UIBezierPath *progressPath = [[UIBezierPath alloc] init];
    //线宽
    progressPath.lineWidth = self.progerWidth;
    //颜色
    [self.progerssColor set];
    //拐角
    progressPath.lineCapStyle = kCGLineCapRound;
    progressPath.lineJoinStyle = kCGLineJoinRound;

    //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
    [progressPath addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:M_PI * 1.5 endAngle:M_PI * 1.5 + M_PI * 2 * _progress clockwise:YES];
    //连线
    [progressPath stroke];
}

@end

