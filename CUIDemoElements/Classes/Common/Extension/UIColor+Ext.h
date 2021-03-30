//
//  UIColor+Ext.h
//  Pods
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Ext)

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithIntRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b;
+ (UIColor *)colorWithIntRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b alpha:(NSInteger)a;

@end

