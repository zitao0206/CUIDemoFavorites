//
//  CUIInputAudioView.m
//  Pods
//
//  Created by Leon on 07/04/2021.
//

#import "CUIInputAudioView.h"

@interface CUIInputAudioView ()
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIView *leftHeadBgView;
@property (nonatomic, strong) UIImageView *leftHeadImageView;

@property (nonatomic, strong) UIView *rightHeadBgView;
@property (nonatomic, strong) UIImageView *rightHeadImageView;

@property (nonatomic, strong) UIButton *beginBtn;
@end

@implementation CUIInputAudioView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.rightHeadBgView];
        [self.contentView addSubview:self.leftHeadBgView];
        [self.contentView addSubview:self.beginBtn];
    }
    return self;
}

- (void)showWithAnimation
{
    self.leftHeadBgView.hidden = NO;
    self.rightHeadBgView.hidden = NO;
    self.leftHeadBgView.left = -self.leftHeadBgView.width;
    self.rightHeadBgView.left = self.contentView.width;
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.leftHeadBgView.left = (self.contentView.width - self.leftHeadBgView.width * 2 + 10) / 2.0;
        self.rightHeadBgView.left = self.leftHeadBgView.right - 10;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (UIView *)leftHeadBgView
{
    if (!_leftHeadBgView) {
        _leftHeadBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        _leftHeadBgView.backgroundColor = [UIColor whiteColor];
        UIImage *image = CUIImageNamed(@"cui_mahuateng");
        _leftHeadImageView = [[UIImageView alloc]initWithImage:image];
        _leftHeadImageView.size = CGSizeMake(60, 60);
        _leftHeadImageView.layer.cornerRadius = 60 /2.0;
        _leftHeadImageView.layer.masksToBounds = YES;
        _leftHeadImageView.backgroundColor = [UIColor clearColor];
        _leftHeadBgView.layer.cornerRadius = 64 /2.0;
        _leftHeadBgView.layer.masksToBounds = YES;
        [_leftHeadBgView addSubview:_leftHeadImageView];
        _leftHeadBgView.hidden = YES;
    }
    return _leftHeadBgView;
}

- (UIView *)rightHeadBgView
{
    if (!_rightHeadBgView) {
        _rightHeadBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        _rightHeadBgView.backgroundColor = [UIColor whiteColor];
        UIImage *image = CUIImageNamed(@"cui_mayun");
        _rightHeadImageView = [[UIImageView alloc]initWithImage:image];
        _rightHeadImageView.size = CGSizeMake(60, 60);
        _rightHeadImageView.layer.cornerRadius = 60 /2.0;
        _rightHeadImageView.layer.masksToBounds = YES;
        _rightHeadImageView.backgroundColor = [UIColor clearColor];
        _rightHeadBgView.layer.cornerRadius = 64 /2.0;
        _rightHeadBgView.layer.masksToBounds = YES;
        [_rightHeadBgView addSubview:_rightHeadImageView];
        _rightHeadBgView.hidden = YES;
    }
    return _rightHeadBgView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _contentView.clipsToBounds = YES;
    }
    return _contentView;
}

- (UIButton *)beginBtn
{
    if (!_beginBtn) {
        _beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_beginBtn addTarget:self action:@selector(showWithAnimation) forControlEvents:UIControlEventTouchUpInside];
        [_beginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _beginBtn.titleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        [_beginBtn setTitle:@"点击开始" forState:UIControlStateNormal];
    }
    return _beginBtn;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.beginBtn sizeToFit];
    self.beginBtn.top = 0;
    self.beginBtn.centerX = self.bounds.size.width / 2.0;
    
    self.leftHeadBgView.centerY = self.bounds.size.height / 2.0;
    self.leftHeadImageView.top = 2;
    self.leftHeadImageView.left = 2;
    
    self.rightHeadBgView.centerY = self.bounds.size.height / 2.0;
    self.rightHeadImageView.top = 2;
    self.rightHeadImageView.left = 2;
    
    self.leftHeadBgView.left =  -self.leftHeadBgView.width;
    self.rightHeadBgView.left = self.width;
}

@end

