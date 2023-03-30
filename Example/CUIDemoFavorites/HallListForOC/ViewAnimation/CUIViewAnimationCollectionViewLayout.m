//
//  CUIViewAnimationCollectionViewLayout.m
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import "CUIViewAnimationCollectionViewLayout.h"
#import "CUIDemoCellItemModel.h"
#import "CUIDemoViewAnimationData.h"

static const NSInteger ColumnCount = 2;
static const CGFloat RowMagin = 5;
static const CGFloat ColumnMagin = 5;
static const UIEdgeInsets edge = {0,5,0,5};

#define CellWidth   (kScreenWidth - 15) / 2.0
#define VideoCellHeight   CellWidth * 1000/750
#define ImageCellHeight   VideoCellHeight

@interface CUIViewAnimationCollectionViewLayout()
@property (strong, nonatomic) NSArray <CUIDemoCellItemModel *> *items;
/** 存放每个item的属性数组 */
@property (nonatomic, strong) NSMutableArray *array;
/** 存放最短高度的数组 */
@property (nonatomic, strong) NSMutableArray *minheight;
/** 内容的高度 */
@property (nonatomic, assign) CGFloat contentH;

@end

@implementation CUIViewAnimationCollectionViewLayout

- (NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (NSMutableArray *)minheight
{
    if (!_minheight) {
        _minheight = [NSMutableArray array];
    }
    return _minheight;
}


// 准备布局
- (void)prepareLayout
{
    [super prepareLayout];
    
    self.items = [[CUIDemoViewAnimationData obtainData] mutableCopy];
    // 清除之前计算的所有高度
    [self.minheight removeAllObjects];
    //给数组初始化值，防止数组越界
    for (NSInteger i = 0; i < ColumnCount; i++) {
        [self.minheight addObject:@(edge.top)];
    }
    // 清除之前所有的布局属性
    [self.array removeAllObjects];
    
    // 1.创建每个item的属性
    // 获取第0section的item个数
    NSInteger count = self.items.count;
    // for循环给每个item创建属性
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        // 将属性加入属性数组中
        [self.array addObject:attr];
    }
}

// 返回每个item的属性
- (NSArray <UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.array;
}

// 设置单个item的属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat collectViewW = self.collectionView.frame.size.width;
    CGFloat w = (collectViewW - edge.left - edge.right - ColumnMagin * (ColumnCount - 1)) / ColumnCount;
    
    CGFloat h = 0.0;
    NSInteger row = indexPath.row;
    if (row < self.items.count) {
       CUIDemoCellItemModel *item = [self.items objectAtIndex:row];
       if (item.cellType == ImageItemCellType) {
           h = ImageCellHeight;
       } else {
           h = VideoCellHeight;
       }
    }
    // 假如最短的那列为第0列
    NSInteger minColumn = 0;
    // 这里要注意数组越界（一开始数组里面先初始化值）
    CGFloat minColumnHeight = [self.minheight[0] doubleValue]; // 最短那列的高度
    // 通过比较获取实际最短的那列高度
    for (NSInteger i=1; i< ColumnCount; i++) {
        // 获取第i列的高度
        CGFloat columnHeight = [self.minheight[i] doubleValue];
        // 比较并找出最短列
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            minColumn = i;
        }
    }
    // 获取x、y
    CGFloat x = edge.left + minColumn * (w + ColumnMagin);
    CGFloat y = minColumnHeight;
    // 判断是否是在第一行，如果不是，就增加行间距
    if (y != edge.top) {
        y += RowMagin;
    }
    // 设置frame
    attr.frame = CGRectMake(x, y, CellWidth, h);
    // 更新最短那列
    self.minheight[minColumn] = @(CGRectGetMaxY(attr.frame));
    // 记入内容的高度
    CGFloat contentH = [self.minheight[minColumn] doubleValue];
    if (self.contentH < contentH) {
        self.contentH = contentH;
    }
    return attr;
}

// 设置内容的尺寸
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0 , self.contentH + edge.bottom);
}

@end
