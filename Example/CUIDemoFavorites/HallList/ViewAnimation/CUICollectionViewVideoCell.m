//
//  CUICollectionViewVideoCell.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUICollectionViewVideoCell.h"
#import "CUIDemoCellItemModel.h"
#import <AVFoundation/AVFoundation.h>

@interface CUICollectionViewVideoCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *classLabel;

@property (nonatomic, strong) AVPlayer *player;//播放器对象
@property (nonatomic, strong) AVPlayerItem *currentPlayerItem;

@end

@implementation CUICollectionViewVideoCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.classLabel];
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.top = 0;
    self.titleLabel.left = 0;
    
    self.classLabel.bottom = self.contentView.height;
    self.classLabel.right = self.contentView.width;
}

- (void)refreshData:(id)data
{
    if ([data isKindOfClass:[CUIDemoCellItemModel class]]) {
        CUIDemoCellItemModel *item = (CUIDemoCellItemModel *)data;
        self.titleLabel.text = item.descrip;
        [self.titleLabel sizeToFit];
        self.classLabel.text = item.className;
        [self.classLabel sizeToFit];
        
        //本地视频路径
        NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"CUIDemoExamples" withExtension:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
        
        NSString *localFilePath = [bundle pathForResource:item.imageName ofType:item.imageType];
        NSAssert(localFilePath.length > 0, @"视频资源异常！！！");
        NSURL *localVideoUrl = [NSURL fileURLWithPath:localFilePath];
        NSAssert(localVideoUrl != nil, @"视频资源异常！！！");
        AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:localVideoUrl];
        self.currentPlayerItem = playerItem;
        self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
        AVPlayerLayer *avLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        avLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        avLayer.frame = self.contentView.bounds;
        [self.contentView.layer addSublayer:avLayer];
        
        [self.contentView bringSubviewToFront:self.titleLabel];
        [self.contentView bringSubviewToFront:self.classLabel];
        
        [self.player play];
        
        [self setNeedsLayout];
    }
}

- (void)moviePlayDidEnd:(NSNotification*)notification
{
    AVPlayerItem *item = [notification object];
    [item seekToTime:kCMTimeZero];
    [self.player play];
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textColor = [[UIColor whiteColor]colorWithAlphaComponent:0.9];
        _titleLabel.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    }
    return _titleLabel;
}

- (UILabel *)classLabel
{
    if (!_classLabel) {
        _classLabel = [UILabel new];
        _classLabel.textAlignment = NSTextAlignmentRight;
        _classLabel.font = [UIFont systemFontOfSize:10];
        _classLabel.textColor = [[UIColor whiteColor]colorWithAlphaComponent:0.9];
        _classLabel.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    }
    return _classLabel;
}

@end
