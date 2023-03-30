//
//  CUITabSelectView.h
//  Pods
//
//  Created by zitao on 09/01/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CUITabSelectedCallback)(NSUInteger idx);
@interface CUITabSelectViewCell : UICollectionViewCell
@property (nonatomic, readonly, strong) UILabel *titleLabel;

@end;

@interface CUITabSelectView : UIView

@property (nonatomic, copy) NSArray<NSString *> *titles;

@property (nonatomic, strong) UIFont *itemFont;
@property (nonatomic, strong) UIColor *itemColor;
@property (nonatomic, strong) UIColor *itemBgColor;
@property (nonatomic, assign) NSInteger itemWidth;
@property (nonatomic, assign) NSInteger itemHeight;
@property (nonatomic, assign) NSTextAlignment itemTextAlignment;
@property (nonatomic, assign) CGFloat itemCornerRadius;

@property (nonatomic, strong) UIFont *itemSelectedFont;
@property (nonatomic, strong) UIColor *itemSelectedColor;
@property (nonatomic, strong) UIColor *itemSelectedBgColor;
@property (nonatomic, assign) CGFloat itemSelectedCornerRadius;

@property (nonatomic, assign) BOOL showLineView;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineHeight;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineViewOffset;
@property (nonatomic, assign) CGFloat lineCornerRadius;

@property (nonatomic, assign) UIEdgeInsets edgeInsets;

- (void)tabSelectedCallback:(CUITabSelectedCallback)callback;
- (void)setupSelectedIndex:(NSInteger)index withCallBack:(BOOL)needCallBack;

@end
