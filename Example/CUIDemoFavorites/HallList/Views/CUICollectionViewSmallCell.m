//
//  CUICollectionViewSmallCell.m
//
//  Created by Leon0206 on 03/30/2021.
//  Copyright (c) 2021 Leon0206. All rights reserved.
//

#import "CUICollectionViewSmallCell.h"
#import <Masonry/Masonry.h>
#import "CUIDemoCellItemModel.h"


@interface CUICollectionViewSmallCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *authorLabel;
@end
@implementation CUICollectionViewSmallCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(0);
           make.top.mas_equalTo(0);
           make.width.mas_equalTo(self.contentView);
           make.height.mas_equalTo(self.contentView.height);
        }];
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
        NSString *filePath = [[NSBundle mainBundle] pathForResource:item.imageName ofType:item.imageType];
        NSAssert(filePath.length > 0, @"图片或者视频资源异常！！！");
        self.imageView.image = [UIImage imageWithContentsOfFile:filePath];
        [self setNeedsLayout];
    }
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.size = CGSizeMake(self.contentView.width, self.contentView.height);
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textColor = [UIColor colorWithHexString:@"ffffff" alpha:1.0];
        _titleLabel.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.2];
    }
    return _titleLabel;
}

- (UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [UILabel new];
        _authorLabel.textAlignment = NSTextAlignmentRight;
        _authorLabel.font = [UIFont systemFontOfSize:10];
        _authorLabel.textColor = [UIColor colorWithHexString:@"ffffff" alpha:1.0];
        _authorLabel.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.2];
    }
    return _authorLabel;
}


@end
