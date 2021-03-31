//
//  CUIGravityCollisionItemView.h
//  Pods
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//


#import "CUIGravityCollisionItemView.h"
#import <CoreMotion/CoreMotion.h>

@interface CUIGravityCollisionItemView() <UICollisionBehaviorDelegate>
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UIDynamicItemBehavior *dynamicBehavior;

@property (nonatomic, strong) UIImageView *ball;

@property (nonatomic, assign) NSInteger collisionCount;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation CUIGravityCollisionItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _collisionCount = 0;
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer timerWithTimeInterval:4.0f repeats:NO block:^(NSTimer * _Nonnull timer) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf hiddenBallView];
        }];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)setupAnimatorView
{
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
    
    //添加重力的动态特性，使其可执行
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.ball]];
    [self.animator addBehavior:gravity];
    
    
    //添加碰撞的动态特性，使其可执行
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[self.ball]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    collision.collisionMode = UICollisionBehaviorModeEverything;
    collision.collisionDelegate = self;
    [self.animator addBehavior:collision];
    
    //弹性
    NSInteger x_y = arc4random()% 6001;
    
    x_y = x_y - 3000;
    
    CGPoint velocity = CGPointMake(x_y, 2000);
    
    self.dynamicBehavior = [[UIDynamicItemBehavior alloc]initWithItems:@[self.ball]];
    self.dynamicBehavior.allowsRotation = YES;//允许旋转
    
    [self.dynamicBehavior addLinearVelocity:CGPointMake(-velocity.x, -velocity.y) forItem:self.ball];
    [self.dynamicBehavior addAngularVelocity:0.3 forItem:self.ball];
    self.dynamicBehavior.elasticity = 0.6;//弹性
    [self.animator addBehavior:self.dynamicBehavior];
    
}

- (void)setupItemBeginPosition:(CGPoint)point
{
    self.ball.center = point;
    [self addSubview:self.ball];
    [self setupAnimatorView];
}

#pragma mark - UICollisionBehaviorDelegate
- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier atPoint:(CGPoint)p
{
    
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier
{
    self.collisionCount++;
    
    CGPoint p = [self.dynamicBehavior linearVelocityForItem:item];
    
    if (p.y < 0 && fabs(p.y) <= 350.0 && self.collisionCount >= 6) {
        [self hiddenBallView];
    }
    
}

- (void)hiddenBallView
{
    @autoreleasepool {
        self.ball.alpha = 1.0;
        [UIView animateWithDuration:0.1 animations:^{
            self.ball.alpha = 0.0;
        } completion:^(BOOL finished) {
            self.animator = nil;
            [self.ball removeFromSuperview];
            if (self.delegate && [self.delegate respondsToSelector:@selector(ballViewWillBeHidden)]) {
                [self.delegate ballViewWillBeHidden];
            }
            [self removeFromSuperview];
        }];
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (UIImageView *)ball
{
    if (!_ball) {
        _ball = [UIImageView new];
        _ball.image = CUIImageNamed(@"cui_heard_icon");
        _ball.contentMode = UIViewContentModeScaleToFill;
        _ball.frame = CGRectMake(0, 0, 54, 44);
    }
    return _ball;
}
@end
