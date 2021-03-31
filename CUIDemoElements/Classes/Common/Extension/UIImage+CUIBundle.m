//
//  UIImage+CUIBundle.m
//  Pods
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "UIImage+CUIBundle.h"
#import "NSBundle+CUIBundle.h"

@implementation UIImage (CUIBundle)

+ (UIImage *)imageNamed:(NSString *)name withBundleName:(NSString *)bundleName
{
        
    if (! name) {
        return nil;
    }
    return [UIImage imageNamed:name inBundle:[NSBundle cui_bundleWithPodName:bundleName] compatibleWithTraitCollection:nil];
}

+ (nullable UIImage *)cui_animatedImageNamed:(NSString *)name
                                duration:(NSTimeInterval)duration
                           withBundleName:(NSString *)bundleName
{
    if (!name) return nil;
    NSMutableArray <UIImage *> *images = [NSMutableArray array];
    NSInteger i = 0;
    UIImage *image = nil;
    do {
        image = [self imageNamed:[NSString stringWithFormat:@"%@%zd", name, i++]
                           withBundleName:bundleName];
        if (image) {
            [images addObject:image];
        }
    } while (image != nil || i < 2);
    return [self animatedImageWithImages:images duration:duration];
}

@end
