//
//  CUIDemoViewAnimationData.m
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import "CUIDemoViewAnimationData.h"
#import "CUIDemoCellItemModel.h"

@implementation CUIDemoViewAnimationData

+ (NSArray <CUIDemoCellItemModel *> *)obtainData
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:[self.class obtainItemDataWithKeyName:@"FoldNumber" descrip:@"滚动的数字"]];
    [array addObject:[self.class obtainItemDataWithKeyName:@"GravityCollision" descrip:@"仿重力碰撞的动画"]];
    [array addObject:[self.class obtainItemDataWithKeyName:@"ProgressCircle" descrip:@"简易的圆形进度条"]];
    [array addObject:[self.class obtainItemDataWithKeyName:@"InputAudio" descrip:@"语音聊天输入动画"]];
    return array;
}

+ (CUIDemoCellItemModel *)obtainItemDataWithKeyName:(NSString *)keyName descrip:(NSString *)description
{
    NSString *className = [NSString stringWithFormat:@"CUI%@View",keyName];
    NSString *imageName = [NSString stringWithFormat:@"%@",[keyName lowercaseString]];
    NSString *detailVCName = [NSString stringWithFormat:@"CUI%@ViewController",keyName];
    CUIDemoCellItemModel *item = [CUIDemoCellItemModel new];
    item.cellType = VideoItemCellType;
    item.className = className;
    item.imageName = imageName;
    item.imageType = @"mov";
    item.detailVCName = detailVCName;
    item.descrip = description;
    return item;
}

@end
