//
//  CUISenderGravityCollisionView.m
//  Pods
//
//  Created by Leon0206 on 2020/5/9.
//

#import "CUISenderGravityCollisionView.h"
#import "CUIGravityCollisionItemView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface CUISenderGravityCollisionView () <CUIGravityCollisionItemViewDelegate>
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, assign) CGPoint itemPoint;
@property (nonatomic, assign) BOOL endClicked;
@end


@implementation CUISenderGravityCollisionView

- (void)dealloc
{
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _number = 0;
    }
    return self;
}

- (void)setupItemBeginPosition:(CGPoint)point
{
    _itemPoint = point;
}

- (void)setNumber:(NSInteger)number
{
    _number = number;
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfConcurrentClicked:)]) {
        [self.delegate numberOfConcurrentClicked:_number];
    }
}

- (void)beginClick:(BOOL)shake
{
    self.endClicked = NO;
    [self onceClick:shake];
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer timerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf.endClicked) {
            [strongSelf longClick:shake];
        }
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)endClick
{
    [self.timer invalidate];
    self.timer = nil;
    
    self.endClicked = YES;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfClicked:)]) {
        [self.delegate numberOfClicked:self.number];
    }
    self.number = 0;
}

- (void)longClick:(BOOL)shake
{
    self.number ++;
    CUIGravityCollisionItemView *itemView = [[CUIGravityCollisionItemView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    itemView.delegate = self;
    [itemView setupItemBeginPosition:_itemPoint];
    [self addSubview:itemView];
    if (shake) {
        [self shakeEffect];
    }
}

- (void)onceClick:(BOOL)shake
{
    self.number ++ ;
    CUIGravityCollisionItemView *itemView = [[CUIGravityCollisionItemView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    itemView.delegate = self;
    [itemView setupItemBeginPosition:_itemPoint];
    [self addSubview:itemView];
    if (shake) {
        [self shakeEffect];
    }
}

- (void)shakeEffect
{
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *impactLight = [[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleHeavy];
        [impactLight prepare];
        [impactLight impactOccurred];
    } else {
        AudioServicesPlaySystemSound(1520);
    }
}

#pragma mark -- CUIGravityCollisionItemViewDelegate

- (void)ballViewWillBeHidden
{
    if (self.subviews.count <= 1) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(senderViewWillBeHidden)]) {
           
            [self.delegate senderViewWillBeHidden];
            
            [self.timer invalidate];
            self.timer = nil;;
        }
    }
}

- (void)forceDismissView
{
    [self.timer invalidate];
    self.timer = nil;
    self.hidden = YES;
    [self removeFromSuperview];
}

@end
