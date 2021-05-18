//
//  CUIDemoViewControlData.h
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CUIDemoCellItemModel;
NS_ASSUME_NONNULL_BEGIN

@interface CUIDemoViewControlData : NSObject

+ (NSArray <CUIDemoCellItemModel *> *)obtainData;

@end

NS_ASSUME_NONNULL_END
