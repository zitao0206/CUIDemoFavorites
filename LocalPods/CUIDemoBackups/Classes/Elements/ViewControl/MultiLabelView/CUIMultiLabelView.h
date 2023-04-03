//
//  CUIMultiLabelView.h
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUIMultiLabelConfig : NSObject
@property (nonatomic, assign) CGFloat width;            //背景view的宽度，若多行，须设置
@property (nonatomic, strong) UILabel *templateLabel;    //label相关的设置
@property (nonatomic, assign) CGFloat templateHeight;    //label相关的设置
@property (nonatomic, strong) UIColor *backgroundColor;  //背景View的背景色
@property (nonatomic, assign) CGFloat topSpace;         //labels内容相对view的顶部距离
@property (nonatomic, assign) CGFloat leftSpace;        //labels内容相对view的左边距离
@property (nonatomic, assign) CGFloat horizontalSpace;   //label之间的左右间距
@property (nonatomic, assign) CGFloat verticalSpace;     //label之间的上下间距
@property (nonatomic, assign) CGFloat additionalWidth;   //label的附加宽度
@property (nonatomic, assign) NSInteger numberOflines;   //Label的行数，0，没有限制

+ (CUIMultiLabelConfig *)defaultConfig;

@end

typedef void(^MultiLabelConfigBlock)(CUIMultiLabelConfig *config);

@interface CUIMultiLabelView : UIView
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithConfig:(MultiLabelConfigBlock)config;
- (void)refreshDataArray:(NSArray <NSString *> *)array;
@end

NS_ASSUME_NONNULL_END
