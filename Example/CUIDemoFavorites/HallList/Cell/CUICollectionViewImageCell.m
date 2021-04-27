//
//  CUICollectionViewImageCell.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUICollectionViewImageCell.h"
#import <Masonry/Masonry.h>
#import "CUIDemoCellItemModel.h"


@interface CUICollectionViewImageCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *classLabel;
@end
@implementation CUICollectionViewImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(15);
        }];
        [self.contentView addSubview:self.classLabel];
        [self.classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
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
        self.titleLabel.text = item.descrip;
        [self.titleLabel sizeToFit];
        self.classLabel.text = item.className;
        [self.classLabel sizeToFit];
        NSBundle *bundle = [NSBundle cui_bundleWithPodName:@"CUIDemoExamples"];
        NSString *filePath = [bundle pathForResource:item.imageName ofType:item.imageType];
        NSAssert(filePath.length > 0, @"图片资源异常！！！");
        self.imageView.image = [UIImage imageWithContentsOfFile:filePath];
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        [_imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.textColor = [[UIColor whiteColor]colorWithAlphaComponent:1.0];
        _titleLabel.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    }
    return _titleLabel;
}

- (UILabel *)classLabel
{
    if (!_classLabel) {
        _classLabel = [UILabel new];
        _classLabel.textAlignment = NSTextAlignmentRight;
        _classLabel.font = [UIFont systemFontOfSize:11];
        _classLabel.textColor = [[UIColor whiteColor]colorWithAlphaComponent:1.0];
        _classLabel.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    }
    return _classLabel;
}


@end
