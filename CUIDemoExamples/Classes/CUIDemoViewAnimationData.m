//
//  CUIDemoViewAnimationData.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUIDemoViewAnimationData.h"
#import "CUIDemoCellItemModel.h"

@implementation CUIDemoViewAnimationData

+ (NSArray <CUIDemoCellItemModel *> *)obtainData
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    {
        CUIDemoCellItemModel *item = [CUIDemoCellItemModel new];
        item.cellType = VideoItemCellType;
        item.className = @"CUIFoldNumberView";
        item.imageName = @"cui_fold_number";
        item.imageType = @"mov";
        item.author = @"Leon";
        item.detailVCName = @"CUIFoldNumberViewController";
        item.descrip = @"滚动的数字";
        [array addObject:item];
    }
    return array;
}

@end
