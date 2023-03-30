//
//  CUIGravityCollisionItemView.h
//  Pods
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CUIGravityCollisionItemViewDelegate <NSObject>

- (void)ballViewWillBeHidden;

@end

@interface CUIGravityCollisionItemView : UIView

@property (nonatomic, weak) id<CUIGravityCollisionItemViewDelegate> delegate;

- (void)setupItemBeginPosition:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
