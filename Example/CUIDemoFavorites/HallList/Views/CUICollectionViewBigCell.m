//
//  CUICollectionViewBigCell.m
//
//  Created by Leon0206 on 03/30/2021.
//  Copyright (c) 2021 Leon0206. All rights reserved.
//

#import "CUICollectionViewBigCell.h"
#import "CUIDemoCellItemModel.h"
#import <AVFoundation/AVFoundation.h>

@interface CUICollectionViewBigCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *authorLabel;

@property (nonatomic,strong) AVPlayer *player;//播放器对象
@property (nonatomic,strong) AVPlayerItem *currentPlayerItem;

@end

@implementation CUICollectionViewBigCell

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(15);
        }];
        [self.contentView addSubview:self.authorLabel];
        [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.mas_equalTo(self.contentView);
             make.top.mas_equalTo(self.contentView.height - 15);
             make.height.mas_equalTo(15);
        }];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
        
    }
    return self;
}

- (void)refreshData:(id)data
{
    if ([data isKindOfClass:[CUIDemoCellItemModel class]]) {
        CUIDemoCellItemModel *item = (CUIDemoCellItemModel *)data;
        self.titleLabel.text = item.className;
        [self.titleLabel sizeToFit];
        self.authorLabel.text = item.author;
        [self.authorLabel sizeToFit];
        
        //本地视频路径
        NSString *localFilePath = [[NSBundle mainBundle]pathForResource:item.imageName ofType:item.imageType];
        NSAssert(localFilePath.length > 0, @"图片或者视频资源异常！！！");
        NSURL *localVideoUrl = [NSURL fileURLWithPath:localFilePath];
        NSAssert(localVideoUrl != nil, @"图片或者视频资源异常！！！");
        AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:localVideoUrl];
        self.currentPlayerItem = playerItem;
        self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
        AVPlayerLayer *avLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        avLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        avLayer.frame = self.contentView.bounds;
        [self.contentView.layer addSublayer:avLayer];
        
        [self.contentView bringSubviewToFront:self.titleLabel];
        [self.contentView bringSubviewToFront:self.authorLabel];
        
        [self.player play];
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
        _titleLabel.textColor = [UIColor colorWithHexString:@"ffffff"];
        _titleLabel.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.3];
    }
    return _titleLabel;
}

- (UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [UILabel new];
        _authorLabel.textAlignment = NSTextAlignmentRight;
        _authorLabel.font = [UIFont systemFontOfSize:10];
        _authorLabel.textColor = [UIColor colorWithHexString:@"ffffff"];
        _authorLabel.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.3];
    }
    return _authorLabel;
}

@end
