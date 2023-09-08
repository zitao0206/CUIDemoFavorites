//
//  FoldNumberView.h
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import "FoldNumberView.h"
#import "CUIFoldLabel.h"

#define   CUIFoldNumberMaxPlaces 15
#define   CUIUIToolsCheckObj(originValue,targetValue) [self.class checkObj:originValue And:targetValue]

@implementation CUIFoldNumberConfig

+ (CUIFoldNumberConfig *)defaultConfig
{
    CUIFoldNumberConfig *config = [CUIFoldNumberConfig new];
    config.font = [UIFont systemFontOfSize:10.0];
    config.textColor = [UIColor blackColor];
    config.labelBgColor =  [UIColor lightGrayColor];
    config.places = 7;
    config.labelSize = CGSizeMake(30, 30);
    config.labelMargin = 10;
    return config;
}

@end

@interface FoldNumberView ()

@property (nonatomic, strong) CUIFoldNumberConfig *config;

@property (nonatomic, strong) NSMutableArray *labelArray;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIImage *textImage;

@property (nonatomic, strong) UIColor *labelBgColor;

@property (nonatomic, strong) UIImage *labelBgImage;

@property (nonatomic, assign) NSInteger places;
@property (nonatomic, assign) CGSize labelSize;
@property (nonatomic, assign) CGFloat labelMargin;

@property (nonatomic, assign) BOOL autoAdaption;


@end

@implementation FoldNumberView

- (instancetype)initWithConfig:(FoldNumberConfigBlock)foldNumberConfig
{
    self = [super init];
        if (self) {
           
            _config = [CUIFoldNumberConfig new];
            if (foldNumberConfig) {
                foldNumberConfig(_config);
            } else {
                _config = [CUIFoldNumberConfig defaultConfig];
            }
            [self setupConfigData];
            [self buildUI];
            self.frame = CGRectMake(0, 0, (_places*_labelSize.width)+((_places-1)*_labelMargin), _labelSize.height);
             self.backgroundColor = [UIColor redColor];
        }
        return self;
}

- (void)setupConfigData
{
    CUIUIToolsCheckObj(self.backgroundColor, self.config.backgroundColor);
    CUIUIToolsCheckObj(self.font, self.config.font);
    CUIUIToolsCheckObj(self.textColor, self.config.textColor);
    CUIUIToolsCheckObj(self.textImage, self.config.textImage);
    CUIUIToolsCheckObj(self.labelBgColor, self.config.labelBgColor);
    CUIUIToolsCheckObj(self.labelBgImage, self.config.labelBgImage);
    self.places = self.config.places;
    if (self.places <= 0) {
        self.autoAdaption = YES;
    }
    self.labelSize = self.config.labelSize;
    self.labelMargin = self.config.labelMargin;

}

- (void)buildUI
{
    _labelArray = [NSMutableArray array];
    if (!self.autoAdaption) {
        for (int i = 0; i < _places; i++) {
            CUIFoldLabel *foldLabel = [[CUIFoldLabel alloc] init];
            foldLabel.frame = CGRectMake(i*(_labelSize.width+_labelMargin), 0, _labelSize.width, _labelSize.height);
            [self addSubview:foldLabel];
            [_labelArray addObject:foldLabel];
        }
    } else {
        for (int i = 0; i < CUIFoldNumberMaxPlaces; i++) {
           CUIFoldLabel *foldLabel = [[CUIFoldLabel alloc] init];
           [_labelArray addObject:foldLabel];
        }
    }
}

- (void)setNumberValue:(NSString *)numberValue
{
    _numberValue = numberValue;
    if (!self.autoAdaption) {
        if (numberValue.length < _places) {
               for (int i = 0; i < (_places - numberValue.length); i++) {
                   _numberValue = [NSString stringWithFormat:@"0%@",_numberValue];
               }
           }
           NSMutableArray *arr = [NSMutableArray new];
           for (int i = 0; i < _places; i++) {
               [arr addObject:@(i)];
           }
           __weak typeof(self) weakSelf = self;
           [_labelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
               CUIFoldLabel *label = obj;
               
               char c = [weakSelf.numberValue characterAtIndex:idx];
               NSString *str = [NSString stringWithFormat:@"%c",c];
               
               if ([str integerValue] == label.currentNum) {
                   [arr removeLastObject];
               }
           }];
           
           [_labelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
               CUIFoldLabel *label = obj;
               
               char c = [weakSelf.numberValue characterAtIndex:idx];
               NSString *str = [NSString stringWithFormat:@"%c",c];
               NSInteger arc = 0;
               NSString *sec = nil;
               if ([str integerValue] != label.currentNum) {
                   if (self.config.changeMode != CUIFoldNumberMeanwhileMode) {
                       if (self.config.changeMode == CUIFoldNumberRandomMode) {
                           arc = arc4random()%arr.count;
                           sec = arr[arc];
                           [arr removeObjectAtIndex:arc];
                       } else if (self.config.changeMode == CUIFoldNumberLeftMode) {
                           sec = arr.firstObject;
                           [arr removeObjectAtIndex:0];
                       } else {
                           sec = arr.lastObject;
                           [arr removeObjectAtIndex:arr.count-1];
                       }
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([sec intValue]*0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                               [label updateNumber:label.currentNum nextNumber:[str integerValue]];
                       });
                   } else {
                       [label updateNumber:label.currentNum nextNumber:[str integerValue]];
                   }
               }
           }];
        
    } else {
    
        self.places = numberValue.length;
        
        for (int i = 0; i < numberValue.length; i++) {
            CUIFoldLabel *foldLabel = [_labelArray objectAtIndex:CUIFoldNumberMaxPlaces - numberValue.length + i];
            foldLabel.frame = CGRectMake(i*(_labelSize.width+_labelMargin), 0, _labelSize.width, _labelSize.height);
            [self addSubview:foldLabel];
        }
    
        NSMutableArray *arr = [NSMutableArray new];
        for (int i = 0; i < numberValue.length; i++) {
            [arr addObject:@(i)];
        }

        for (int i = 0; i < numberValue.length; i++) {
            CUIFoldLabel *foldLabel = [_labelArray objectAtIndex:CUIFoldNumberMaxPlaces - numberValue.length + i];
 
            char c = [self.numberValue characterAtIndex:i];
            NSString *str = [NSString stringWithFormat:@"%c",c];
           
            if ([str integerValue] == foldLabel.currentNum) {
               [arr removeLastObject];
            }
        }
        
        for (int i = 0; i < numberValue.length; i++) {
            CUIFoldLabel *label = [_labelArray objectAtIndex:CUIFoldNumberMaxPlaces - numberValue.length + i];
             char c = [self.numberValue characterAtIndex:i];
             NSString *str = [NSString stringWithFormat:@"%c",c];
             NSInteger arc = 0;
             NSString *sec = nil;
             if ([str integerValue] != label.currentNum) {
                 if (self.config.changeMode != CUIFoldNumberMeanwhileMode) {
                     if (self.config.changeMode == CUIFoldNumberRandomMode) {
                         arc = arc4random()%arr.count;
                         sec = arr[arc];
                         [arr removeObjectAtIndex:arc];
                     } else if (self.config.changeMode == CUIFoldNumberLeftMode) {
                         sec = arr.firstObject;
                         [arr removeObjectAtIndex:0];
                     } else {
                         sec = arr.lastObject;
                         [arr removeObjectAtIndex:arr.count-1];
                     }
                     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([sec intValue]*0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                             [label updateNumber:label.currentNum nextNumber:[str integerValue]];
                     });
                 } else {
                     [label updateNumber:label.currentNum nextNumber:[str integerValue]];
                 }
             }
        }
        
    }
    [self setNeedsLayout];
   
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, (_places*_labelSize.width)+((_places-1)*_labelMargin), _labelSize.height);
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    for (int i = 0; i < _labelArray.count; i++) {
        CUIFoldLabel *label = _labelArray[i];
        label.font = font;
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    for (int i = 0; i < _labelArray.count; i++) {
        CUIFoldLabel *label = _labelArray[i];
        label.textColor = textColor;
    }
}

- (void)setLabelBgColor:(UIColor *)labelBgColor
{
    _labelBgColor = labelBgColor;
    for (int i = 0; i < _labelArray.count; i++) {
        CUIFoldLabel *label = _labelArray[i];
        label.backgroundColor = labelBgColor;
    }
}

- (void)setTextImage:(UIImage *)textImage
{
    _textImage = textImage;
    for (int i = 0; i < _labelArray.count; i++) {
        CUIFoldLabel *label = _labelArray[i];
        label.textImage = textImage;
    }
}

- (void)setLabelBgImage:(UIImage *)labelBgImage
{
    _labelBgImage = labelBgImage;
    for (int i = 0; i < _labelArray.count; i++) {
        CUIFoldLabel *label = _labelArray[i];
        label.backgroundImage = labelBgImage;
    }
}

+ (void)checkObj:(id)originValue And:(id)targetValue
{
    if (!originValue || !targetValue) return;
    if (originValue) {
        if (targetValue) {
            originValue = targetValue;
        } else {
            return;
        }
    }
}

@end
