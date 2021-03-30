//
//  CUIHallListViewController.m
//
//  Created by Leon0206 on 03/30/2021.
//  Copyright (c) 2021 Leon0206. All rights reserved.
//

#import "CUIHallListViewController.h"
#import "CUICollectionViewSmallCell.h"
#import "CUICollectionViewBigCell.h"
#import "CUICollectionViewLayout.h"
#import "CUIDemoData.h"
#import "CUIDemoCellItemModel.h"

#define ScreenWidth   self.view.frame.size.width
#define ScreenHeight  self.view.frame.size.height

#define SmallCellHeight   120
#define BigCellHeight   242
#define Cellwidth (ScreenWidth - 2) / 2.0;

@interface CUIHallListViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray <CUIDemoCellItemModel *> *items;
@end

@implementation CUIHallListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    
    [self.view addSubview:self.collectionView];
    
    self.items = [[CUIDemoData obtainDemoCellData] mutableCopy];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

//footer的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

//每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//cell显示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = nil;
    NSInteger row = indexPath.row;
    if (row < self.items.count) {
        CUIDemoCellItemModel *item = [self.items objectAtIndex:row];
        if (item.cellType == CUIDemoSmallItemCellType) {
            cellIdentifier = @"CUICollectionViewSmallCell";
            CUICollectionViewSmallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
            [cell refreshData:item];
            return cell;
        } else {
            cellIdentifier = @"CUICollectionViewBigCell";
            CUICollectionViewBigCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
            [cell refreshData:item];
            return cell;
        }
    }
    return [CUICollectionViewSmallCell new];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    if (row < self.items.count) {
        CUIDemoCellItemModel *item = [self.items objectAtIndex:row];
        if (item.detailVCName.length > 0) {
            UIViewController *vc = [NSClassFromString(item.detailVCName) new];
            if (vc) {
                vc.title = item.descrip;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
    }
    
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CUICollectionViewLayout *layout = [[CUICollectionViewLayout alloc] init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor colorWithHexString:@"ff2c55" alpha:0.5];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CUICollectionViewSmallCell class] forCellWithReuseIdentifier:@"CUICollectionViewSmallCell"];
        [_collectionView registerClass:[CUICollectionViewBigCell class] forCellWithReuseIdentifier:@"CUICollectionViewBigCell"];
        _collectionView.showsVerticalScrollIndicator = YES;
        _collectionView.showsHorizontalScrollIndicator = YES;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
