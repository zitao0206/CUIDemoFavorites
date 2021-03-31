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
    {
        CUIDemoCellItemModel *item = [CUIDemoCellItemModel new];
        item.cellType = VideoItemCellType;
        item.className = @"GravityCollisionView";
        item.imageName = @"cui_gravity_collision";
        item.imageType = @"mov";
        item.author = @"Leon";
        item.detailVCName = @"CUIGravityCollisionViewController";
        item.descrip = @"仿重力碰撞的动画";
        [array addObject:item];
    }
    return array;
}

@end
