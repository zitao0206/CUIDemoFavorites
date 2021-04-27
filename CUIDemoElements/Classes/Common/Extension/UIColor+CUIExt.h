//
//  UIColor+CUIExt.h
//  Pods
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CUIExt)

+ (UIColor *)cui_colorWithHex:(NSUInteger)hexColor;
+ (UIColor *)cui_colorWithHex:(NSUInteger)hexColor alpha:(CGFloat)alpha;
+ (UIColor *)cui_colorWithHexString:(NSString *)hexString;
+ (UIColor *)cui_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end

