//
//  UIImage+CUIBundle.h
//  Pods
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CUIBundle)

+ (UIImage *)cui_imageNamed:(NSString *)name withBundleName:(NSString *)bundleName;

@end

#define CUIImageNamed(...) [UIImage cui_imageNamed:(__VA_ARGS__) withBundleName:CUI_MODULE_NAME]

NS_ASSUME_NONNULL_END
