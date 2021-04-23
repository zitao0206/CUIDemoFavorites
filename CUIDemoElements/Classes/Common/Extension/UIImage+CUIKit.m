//
//  UIImage+CUIKit.m
//  Pods
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "UIImage+CUIKit.h"
#import "NSBundle+CUIBundle.h"

@implementation UIImage (CUIKit)


+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.f);
    [color ?: [UIColor clearColor] setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
}

@end
