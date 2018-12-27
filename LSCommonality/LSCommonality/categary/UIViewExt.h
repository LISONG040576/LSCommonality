/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
@end

@interface UIView (HFHelper)

- (void)loadData:(nullable id)data;

@end


@interface UIView (HFErrorPlaceHolder)

/**
 显示无数据画面
 
 @param imageName 中间图片名称
 @param noDataInfo 提示信息
 @param top 距离顶部的高度
 @param imageWidth 图片的宽度
 */
- (void)showNodataWithImage:(NSString *)imageName noDataInfo:(NSString *)noDataInfo top:(CGFloat)top imageWith:(CGFloat)imageWidth;

/**
 消除
 */
- (void)dismissNoDataView;

@end


/**
 无数据时显示的View
 */
@interface HENoDataView : UIView

- (instancetype)initWithFrame:(CGRect)frame showImage:(NSString *)imageName noDataTip:(NSString *)noDataInfo;

- (instancetype)initWithFrame:(CGRect)frame imageTopHeight:(CGFloat)topHeight imageWith:(CGFloat)imageWidth showImage:(NSString *)imageName noDataTip:(NSString *)noDataInfo;

@end
