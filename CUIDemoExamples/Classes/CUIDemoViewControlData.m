//
//  CUIDemoViewControlData.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUIDemoViewControlData.h"
#import "CUIDemoCellItemModel.h"

@implementation CUIDemoViewControlData

+ (NSArray <CUIDemoCellItemModel *> *)obtainData
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    {
        CUIDemoCellItemModel *item = [CUIDemoCellItemModel new];
        item.cellType = ImageItemCellType;
        item.className = @"CUIMultiLabelView";
        item.imageName = @"cui_multi_label";
        item.imageType = @"png";
        item.author = @"Leon";
        item.detailVCName = @"CUIMultiLabelViewController";
        item.descrip = @"多标签展示";
        [array addObject:item];
    }
    return array;
}
@end
