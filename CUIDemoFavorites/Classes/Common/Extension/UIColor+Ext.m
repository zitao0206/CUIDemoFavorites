//
//  UIColor+Ext.m
//  Pods
//
//  Created by Leon0206 on 03/30/2021.
//  Copyright (c) 2021 Leon0206. All rights reserved.
//

#import "UIColor+Ext.h"

@implementation UIColor (Ext)

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [UIColor colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if (cString.length == 3) {
        NSMutableString *rString = [[NSMutableString alloc] initWithCapacity:6];
        [rString appendFormat:@"%C%C%C%C%C%C", [cString characterAtIndex:0], [cString characterAtIndex:0], [cString characterAtIndex:1], [cString characterAtIndex:1], [cString characterAtIndex:2], [cString characterAtIndex:2]];
        cString = [NSString stringWithString:rString];
    }
    else if (cString.length == 4) {
        NSMutableString *rString = [[NSMutableString alloc] initWithCapacity:8];
        [rString appendFormat:@"%C%C%C%C%C%C%C%C", [cString characterAtIndex:0], [cString characterAtIndex:0], [cString characterAtIndex:1], [cString characterAtIndex:1], [cString characterAtIndex:2], [cString characterAtIndex:2], [cString characterAtIndex:3], [cString characterAtIndex:3]];
        cString = [NSString stringWithString:rString];
    }
    if ([cString length] != 6 && [cString length] != 8) return [UIColor whiteColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *aString = @"ff";
    if ([cString length] == 8) {
        aString = [cString substringWithRange:range];
        range.location += 2;
    }
    NSString *rString = [cString substringWithRange:range];
    range.location += 2;
    NSString *gString = [cString substringWithRange:range];
    range.location += 2;
    NSString *bString = [cString substringWithRange:range];
    unsigned r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithIntRed:r green:g blue:b alpha:alpha];
}

+ (UIColor *)colorWithIntRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b
{
    return [UIColor colorWithIntRed:r green:g blue:b alpha:255];
}

+ (UIColor *)colorWithIntRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b alpha:(NSInteger)a
{
    return [UIColor colorWithRed:((CGFloat)r / 255.f) green:((CGFloat)g / 255.f) blue:((CGFloat)b / 255.f) alpha:((CGFloat)a / 255.f)];
}

@end
