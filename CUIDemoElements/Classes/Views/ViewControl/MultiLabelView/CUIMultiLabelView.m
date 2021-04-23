//
//  CUIMultiLabelView.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUIMultiLabelView.h"

#define MDWidth [UIScreen mainScreen].bounds.size.width
#define MDHeight [UIScreen mainScreen].bounds.size.height

#define MDViewWidth self.config.width

#define MDLabelHorizontalSpace 8
#define MDLabelVerticalSpace 8

@implementation CUIMultiLabelConfig

- (instancetype)init
{
    if (self = [super init]) {
        _width = 0;
        _templateLabel = [UILabel new];
        _topSpace = 0;
        _leftSpace = 0;
        _horizontalSpace = 8;
        _verticalSpace = 8;
        _additionalWidth = 8;
        _backgroundColor = [UIColor clearColor];
        _numberOflines = 1;
    }
    return self;
}

+ (CUIMultiLabelConfig *)defaultConfig
{
    CUIMultiLabelConfig *config = [CUIMultiLabelConfig new];
    config.width = MDWidth;
    config.templateLabel = [UILabel new];
    config.topSpace = 0;
    config.leftSpace = 0;
    config.horizontalSpace = 8;
    config.verticalSpace = 8;
    config.additionalWidth = 8;
    config.backgroundColor = [UIColor clearColor];
    config.numberOflines = 1;
    return config;
}


@end

@interface CUIMultiLabelView ()
@property (nonatomic, strong) CUIMultiLabelConfig *config;
@end

@implementation CUIMultiLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
         
    }
    return self;
}

- (instancetype)initWithConfig:(MultiLabelConfigBlock)labelConfig
{
    self = [super init];
     if (self) {
         _config = [CUIMultiLabelConfig new];
         if (labelConfig) {
             labelConfig(_config);
         } else {
             _config = [CUIMultiLabelConfig defaultConfig];
         }
         self.backgroundColor = _config.backgroundColor;
         self.frame = CGRectMake(0, 0, _config.width, 0);
     }
     return self;
}

- (void)refreshDataArray:(NSArray <NSString *> *)array
{
    NSUInteger count = array.count;
    if (count == 0) {
        self.hidden = YES;
        return;
    }
    CGFloat labelX = self.config.leftSpace;
    CGFloat labelY = self.config.topSpace;
    NSInteger lines = 0;
    for (int i = 0; i < count; i++) {
        UILabel *label = nil;
        if (i == 0) {
            label = self.config.templateLabel;
        } else {
            label = [UILabel new];
            label.font = self.config.templateLabel.font;
            label.textColor = self.config.templateLabel.textColor;
            label.textAlignment = self.config.templateLabel.textAlignment;
            label.backgroundColor = self.config.templateLabel.backgroundColor;
            label.layer.cornerRadius = self.config.templateLabel.layer.cornerRadius;
            label.clipsToBounds = self.config.templateLabel.clipsToBounds;
        }
        NSString *text = array[i];
        if (self.config.numberOflines == 1) {
            //此种情况背景view的宽度自适应
            CGSize size = [self sizeWithText:text withFont:self.config.templateLabel.font maxSize:CGSizeMake(MDWidth, _config.templateHeight)];
            label.text = array[i];
            label.frame = CGRectMake(labelX, labelY, size.width + _config.additionalWidth, _config.templateHeight);
            labelX += (MDLabelHorizontalSpace + label.frame.size.width);
            
        } else {
            //背景view的宽度必须要提前设置好
            NSAssert(self.config.width > 0, @"多行须设置显示View的宽度！！！");
            
            NSInteger numberOflines = 0;
            if (self.config.numberOflines == 0) {
                numberOflines = 9999;
            } else {
                numberOflines = self.config.numberOflines;
            }
            CGSize size = [self sizeWithText:text withFont:self.config.templateLabel.font maxSize:CGSizeMake(MDViewWidth, _config.templateHeight)];
            label.text = array[i];
            if ((labelX + MDLabelHorizontalSpace + size.width) > self.config.width - 2*self.config.leftSpace) {
                lines ++;
                if (lines >= numberOflines) {
                    break;
                }
                labelX = self.config.leftSpace;
                labelY += _config.templateHeight + MDLabelVerticalSpace;
            }
            label.frame = CGRectMake(labelX, labelY, size.width + _config.additionalWidth, _config.templateHeight);
            labelX += (MDLabelHorizontalSpace + label.frame.size.width);
        }
        [self addSubview:label];
    }
    if (_config.numberOflines == 1) {
        self.frame = CGRectMake(0, 0, labelX - MDLabelHorizontalSpace + _config.leftSpace,  _config.templateHeight + 2*self.config.topSpace);
    } else {
        self.frame = CGRectMake(0, 0, self.config.width, labelY + _config.templateHeight + self.config.topSpace);
    }
    
    [self setNeedsLayout];
}

- (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

}

@end

