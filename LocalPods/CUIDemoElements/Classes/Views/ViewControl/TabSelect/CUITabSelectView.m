//
//  CUITabSelectView.m
//  Pods
//
//  Created by Leon on 09/01/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUITabSelectView.h"
#import "Masonry.h"

@interface CUITabSelectViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CUITabSelectViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    self.titleLabel.width = self.contentView.width;
    self.titleLabel.height = self.contentView.height;
    self.titleLabel.center = self.contentView.center;
}

- (void)refreshDataWith:(NSString *)title
{
    self.titleLabel.text = title;
    [self setNeedsLayout];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end

@interface CUITabSelectView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) CUITabSelectedCallback callback;
@property (nonatomic) BOOL selectedCellExist;
@end

@implementation CUITabSelectView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _titles = [NSMutableArray array];
        [self addSubview:self.collectionView];
        self.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.3];
        self.collectionView.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.3];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.top = 0;
    self.collectionView.left = 0;
}

- (void)setTitles:(NSArray<NSString *> *)titles
{
    _titles = titles;
    [self updateLineView];
}

- (void)updateLineView
{
    self.lineView.hidden = !self.showLineView;
    if (self.showLineView) {
        
        [self.collectionView addSubview:self.lineView];
        
        self.lineView.backgroundColor = _lineColor;
        self.lineView.height = _lineHeight;
        self.lineView.width = _lineWidth;
        self.lineView.layer.cornerRadius = _lineCornerRadius;
        self.lineView.clipsToBounds = YES;
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (self.titles.count == 0) {
        return;
    }
    if (selectedIndex >= self.titles.count) {
        _selectedIndex = 0;
    } else {
        _selectedIndex = selectedIndex;
    }
    [self layoutAndScrollToSelectedItem];
}

- (void)setupSelectedIndex:(NSUInteger)index withCallBack:(BOOL)needCallBack
{
    NSAssert(index < self.titles.count, @"index beyond the titles count !!!");
    NSAssert(self.titles.count, @"Please call this method after init titles !!!");
    self.selectedIndex = index;
    if (needCallBack && _callback) {
        _callback(index);
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.itemHeight <= 0) {
        self.itemHeight = self.collectionView.height;
    }
    if (self.itemWidth <= 0) {
        self.itemWidth = 60;
    }
    return CGSizeMake(self.itemWidth, self.itemHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CUITabSelectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CUITabSelectViewCell" forIndexPath:indexPath];
    NSString *title = [self.titles objectAtIndex:indexPath.row];
    if (indexPath.row == self.selectedIndex) {
        [self refreshTitleLabel:cell.titleLabel with:YES];
    } else {
        [self refreshTitleLabel:cell.titleLabel with:NO];
    }
    [cell refreshDataWith:title];
    if (indexPath.row % 2 == 0) {
        cell.contentView.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.1];
    } else {
        cell.contentView.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.1];
    }
   
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self changeItemWithTargetIndex:indexPath.row];
}

- (void)changeItemWithTargetIndex:(NSUInteger)targetIndex
{
    if (self.selectedIndex == targetIndex) {
        return;
    }
    CUITabSelectViewCell *selectedCell = [self obtainCellWith:self.selectedIndex];
    if (selectedCell) {
        [self refreshTitleLabel:selectedCell.titleLabel with:NO];
    }
    CUITabSelectViewCell *targetCell = [self obtainCellWith:targetIndex];
    if (targetCell) {
        [self refreshTitleLabel:targetCell.titleLabel with:YES];
    }
    self.selectedIndex = targetIndex;
}

- (void)refreshTitleLabel:(UILabel *)label with:(BOOL)isSelected
{
    if (isSelected) {
        if (self.itemSelectedFont) {
            label.font = self.itemSelectedFont;
        }
        if (self.itemSelectedColor) {
            label.textColor = self.itemSelectedColor;
        }
        if (self.itemSelectedBgColor) {
            label.backgroundColor = self.itemSelectedBgColor;
        }
        if (self.itemSelectedCornerRadius > 0) {
            label.layer.cornerRadius = self.itemSelectedCornerRadius;
            label.clipsToBounds = YES;
        }
         
    } else {
        if (self.itemFont) {
            label.font = self.itemFont;
        }
        if (self.itemColor) {
            label.textColor = self.itemColor;
        }
        if (self.itemBgColor) {
            label.backgroundColor = self.itemBgColor;
        }
        if (self.itemCornerRadius >= 0) {
            label.layer.cornerRadius = self.itemCornerRadius;
            label.clipsToBounds = YES;
        }
    }
}

- (void)layoutAndScrollToSelectedItem
{
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView setNeedsLayout];
    [self.collectionView layoutIfNeeded];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.selectedIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    CUITabSelectViewCell *selectedCell = [self obtainCellWith:self.selectedIndex];
    if (selectedCell) {
        self.selectedCellExist = YES;
        [self updateLineViewLocation];
    } else {
        self.selectedCellExist = NO;
    }
}

- (void)updateLineViewLocation
{
    CUITabSelectViewCell *cell = [self obtainCellWith:self.selectedIndex];
    [UIView animateWithDuration:0.3 animations:^{
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.lineHeight);
            make.width.mas_equalTo(self.lineWidth);
            make.top.mas_equalTo(self.lineView.top = self.collectionView.height - self.lineView.height + self.lineViewOffset);
            make.centerX.equalTo(cell.titleLabel);
        }];
        [self.collectionView setNeedsLayout];
        [self.collectionView layoutIfNeeded];
    }];
}

- (CUITabSelectViewCell *)obtainCellWith:(NSUInteger)index
{
    return (CUITabSelectViewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (!self.selectedCellExist) {
        [self updateLineViewLocation];
    }
}

#pragma mark - Getter

- (void)tabSelectedCallback:(CUITabSelectedCallback)callback
{
    _callback = callback;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) collectionViewLayout:flowLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CUITabSelectViewCell class] forCellWithReuseIdentifier:@"CUITabSelectViewCell"];
    }
    return _collectionView;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
    }
    return _lineView;
}


@end
