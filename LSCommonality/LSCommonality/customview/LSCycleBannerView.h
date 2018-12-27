//
//  HEZWCycleBannerView.h
//  XinXiaoChu
//
//  Created by WhenWe on 2017/12/21.
//  Copyright © 2017年 海尔智能-李松. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSCycleBannerView;
@protocol LSCycleBannerViewDelegate <NSObject>

/**
 *  页数
 *
 */
- (NSInteger)numberOfPages;

/**
 *  每页的视图
 *
 */
- (UIView *)pageAtIndex:(NSInteger)index;

/**
 *  选中页
 *
 *  @param cycleView 对应的轮播图
 *  @param index          选中的下标
 */
- (void)didSelectedCycleView:(LSCycleBannerView *)cycleView atIndex:(NSInteger)index;

@optional

/**
 滑动停到某个位置

 @param cycleView HEZWCycleBannerView
 @param index 位置
 */
- (void)cycleView:(LSCycleBannerView *)cycleView didScrollToIndex:(NSInteger)index;

@end


@interface LSCycleBannerView : UIView

/**  delegate  **/
@property (nonatomic, assign) id<LSCycleBannerViewDelegate> delegate;

- (void)reloadData;

@end


@interface LSCycleBannerViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView *showView;

@end




