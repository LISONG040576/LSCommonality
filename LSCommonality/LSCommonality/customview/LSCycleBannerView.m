//
//  HEZWCycleBannerView.m
//  XinXiaoChu
//
//  Created by WhenWe on 2017/12/21.
//  Copyright © 2017年 海尔智能-李松. All rights reserved.
//

#import "LSCycleBannerView.h"
#import <Masonry/Masonry.h>

@class LSCycleBannerViewCell;

@interface LSCycleBannerView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *mainCollectionView;
//@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UILabel *pageLabel;
@end

@implementation LSCycleBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBannerUI];
    }
    return self;
}

- (void)reloadData
{

    self.pageLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.pageLabel.text = [NSString stringWithFormat:@"1/%tu", [self.delegate numberOfPages]];
    [self.mainCollectionView reloadData];
    if ([self.mainCollectionView numberOfItemsInSection:0]) {
        [self.mainCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:(UICollectionViewScrollPositionCenteredHorizontally) animated:NO];
    }
    
    if ([self.delegate numberOfPages] == 0) {
        self.pageLabel.hidden = YES;
    }else{
        self.pageLabel.hidden = NO;
    }
}

- (void)setupBannerUI
{
    self.backgroundColor = [UIColor whiteColor];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
    [self.pageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-30);
        make.width.height.mas_equalTo(26);
    }];
}

- (UILabel *)pageLabel
{
    if (!_pageLabel) {
        _pageLabel = [[UILabel alloc] init];
        _pageLabel.textColor = [UIColor whiteColor];
        _pageLabel.font = [UIFont systemFontOfSize:10];
        _pageLabel.textAlignment = NSTextAlignmentCenter;
        _pageLabel.layer.cornerRadius = 13;
        _pageLabel.layer.masksToBounds = YES;
        [self addSubview:_pageLabel];
    }
    return _pageLabel;
}

//- (UIPageControl *)pageControl
//{
//    if (!_pageControl) {
//        _pageControl = [[UIPageControl alloc] init];
//        _pageControl.userInteractionEnabled = NO;
//        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
//        _pageControl.currentPageIndicatorTintColor = UIColorWithHexString(@"ff9e0b");
//        [self addSubview:_pageControl];
//    }
//    return _pageControl;
//}

/* < CollectionView > */
- (UICollectionView *)mainCollectionView
{
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
        flowLaout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLaout.minimumLineSpacing = 0;
        flowLaout.minimumInteritemSpacing = 0;

        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) collectionViewLayout:flowLaout];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.pagingEnabled = YES;
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_mainCollectionView];
        [self registCollectionViewUIsource:_mainCollectionView];
    }
    return _mainCollectionView;
}

/* < 注册初始cell header footer > */
- (void)registCollectionViewUIsource:(UICollectionView *)collectionView
{
    [collectionView registerClass:[LSCycleBannerViewCell class] forCellWithReuseIdentifier:@"LSCycleBannerViewCell"];
}

#pragma mark - CollectionView delegate&datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(numberOfPages)]) {
        return [self.delegate numberOfPages];
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSCycleBannerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSCycleBannerViewCell" forIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(pageAtIndex:)]) {
        cell.showView = [self.delegate pageAtIndex:indexPath.item];
    } else {
        cell.showView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(didSelectedCycleView:atIndex:)]) {
        [self.delegate didSelectedCycleView:self atIndex:indexPath.item];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat x = scrollView.contentOffset.x;
    NSInteger page = (NSInteger)(x / self.bounds.size.width + 0.5);
    self.pageLabel.text = [NSString stringWithFormat:@"%tu/%tu", page + 1, [self.delegate numberOfPages]];
    
    if (x - page * self.bounds.size.width == 0) {
        if ([self.delegate respondsToSelector:@selector(cycleView:didScrollToIndex:)]) {
            [self.delegate cycleView:self didScrollToIndex:page];
        }
    }
}


@end




@implementation LSCycleBannerViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.clipsToBounds = YES;
    }
    return self;
}

- (void)setShowView:(UIView *)showView
{
    if (_showView) {
        [_showView removeFromSuperview];
    }

    _showView = showView;
    _showView.frame = self.contentView.bounds;
    [self.contentView addSubview:_showView];
}

@end
