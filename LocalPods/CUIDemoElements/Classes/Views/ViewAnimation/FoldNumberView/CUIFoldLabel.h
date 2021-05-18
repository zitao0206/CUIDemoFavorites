//
//  CUIFoldLabel.h
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUIFoldLabel : UIView

- (void)updateNumber:(NSInteger)number nextNumber:(NSInteger)nextNumber;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIImage *textImage;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong) UIImage *backgroundImage;

@property (nonatomic, assign) NSInteger currentNum;

@end

NS_ASSUME_NONNULL_END
