//
//  CUIDemoData.h
//
//  Created by Leon0206 on 03/30/2021.
//  Copyright (c) 2021 Leon0206. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CUIDemoCellItemModel;
NS_ASSUME_NONNULL_BEGIN

@interface CUIDemoData : NSObject

+ (NSArray <CUIDemoCellItemModel *> *)obtainDemoCellData;

@end

NS_ASSUME_NONNULL_END
