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
    [array addObject:[self.class obtainItemDataWithKeyName:@"MultiLabel" descrip:@"多标签展示"]];
    [array addObject:[self.class obtainItemDataWithKeyName:@"TabSelect" descrip:@"分段选择"]];
    return array;
}

+ (CUIDemoCellItemModel *)obtainItemDataWithKeyName:(NSString *)keyName descrip:(NSString *)description
{
    NSString *className = [NSString stringWithFormat:@"CUI%@View",keyName];
    NSString *imageName = [NSString stringWithFormat:@"%@",[keyName lowercaseString]];
    NSString *detailVCName = [NSString stringWithFormat:@"CUI%@ViewController",keyName];
    CUIDemoCellItemModel *item = [CUIDemoCellItemModel new];
    item.cellType = ImageItemCellType;
    item.className = className;
    item.imageName = imageName;
    item.imageType = @"png";
    item.detailVCName = detailVCName;
    item.descrip = description;
    return item;
}

@end
