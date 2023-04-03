//
//  CUIProgressCircleView.h
//  Pods
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CUIProgressCircleViewBlock)(CGFloat progress);

@interface CUIProgressCircleView : UIView
@property (nonatomic, copy) CUIProgressCircleViewBlock progressBlock;
@property (nonatomic, assign) BOOL isNeedInnerTimer;
@property (nonatomic, assign) CGFloat progress;

- (void)resume;

- (void)stop;

- (void)reset;

@end

NS_ASSUME_NONNULL_END
