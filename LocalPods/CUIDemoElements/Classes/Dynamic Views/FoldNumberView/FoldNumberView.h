//
//  FoldNumberView.h
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//数字依次滚动顺序
typedef NS_ENUM(NSInteger, CUIFoldNumberChangeMode) {
    CUIFoldNumberMeanwhileMode, //所有数字同时变化
    CUIFoldNumberRightMode,//从右边往左，例如个位先变，其次是十位，依次变化
    CUIFoldNumberLeftMode,//顺序反过来
    CUIFoldNumberRandomMode, //随机
};

@interface CUIFoldNumberConfig : NSObject
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIImage *textImage;
@property (nonatomic, strong) UIColor *labelBgColor;
@property (nonatomic, strong) UIImage *labelBgImage;
@property (nonatomic, assign) NSInteger places; //为0时，开启自适应模式
@property (nonatomic, assign) CGSize labelSize;
@property (nonatomic, assign) CGFloat labelMargin;

@property (nonatomic, assign) CUIFoldNumberChangeMode changeMode;

+ (CUIFoldNumberConfig *)defaultConfig;

@end

typedef void(^FoldNumberConfigBlock)(CUIFoldNumberConfig *config);

@interface FoldNumberView : UIView

@property (nonatomic, copy) NSString *numberValue;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithConfig:(FoldNumberConfigBlock)foldNumberConfig;

@end

NS_ASSUME_NONNULL_END
