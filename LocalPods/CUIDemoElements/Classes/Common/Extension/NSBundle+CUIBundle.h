//
//  NSBundle+CUIBundle.h
//  Pods
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (CUIBundle)

+ (instancetype __nullable)cui_bundleWithPodName:(NSString * __nullable)podName;

@end

#define CUIPodBundle [NSBundle cui_bundleWithPodName:NE_MODULE_NAME]

NS_ASSUME_NONNULL_END
