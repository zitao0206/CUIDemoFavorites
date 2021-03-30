//
//  CUIDemoData.m
//
//  Created by Leon0206 on 03/30/2021.
//  Copyright (c) 2021 Leon0206. All rights reserved.
//

#import "CUIDemoData.h"
#import "CUIDemoCellItemModel.h"

@implementation CUIDemoData
+ (NSArray <CUIDemoCellItemModel *> *)obtainDemoCellData
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    {
        CUIDemoCellItemModel *item = [CUIDemoCellItemModel new];
        item.cellType = CUIDemoBigItemCellType;
        item.className = @"CUIFoldNumberView";
        item.imageName = @"cui_fold_number";
        item.imageType = @"mov";
        item.author = @"Leon";
        item.detailVCName = @"CUIFoldNumberViewController";
        item.descrip = @"滚动的数字";
        [array addObject:item];
    }
    {
        CUIDemoCellItemModel *item = [CUIDemoCellItemModel new];
        item.cellType = CUIDemoSmallItemCellType;
        item.className = @"CUIMultiLabelView";
        item.imageName = @"cui_multi_label";
        item.imageType = @"png";
        item.author = @"Leon";
        item.detailVCName = @"CUIMultiLabelViewController";
        item.descrip = @"多标签展示";
        [array addObject:item];
    }
    {
         CUIDemoCellItemModel *item = [CUIDemoCellItemModel new];
         item.cellType = CUIDemoSmallItemCellType;
         item.className = @"CUIImageTextView";
         item.imageName = @"cui_image_text";
         item.imageType = @"png";
         item.author = @"Leon";
         item.detailVCName = @"CUIImageTextViewController";
         item.descrip = @"多功能显示标签";
         [array addObject:item];
     }
    
    
    return array;
}
@end
