//
//  LSCornerImageView.h
//  LSCommonality
//
//  Created by 海尔智能-李松 on 2018/12/7.
//  Copyright © 2018 lisong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, LSCornerImageViewCorner) {
    LSCornerImageViewCornerLeftTop = 1 << 0,//左上
    LSCornerImageViewCornerRightTop = 1 << 1,//右上
    LSCornerImageViewCornerLeftBottom = 1 << 2,//左下
    LSCornerImageViewCornerRightBottom = 1 << 3,//右下
    
    LSCornerImageViewCornerTop = LSCornerImageViewCornerLeftTop | LSCornerImageViewCornerRightTop,//左上，右上
    LSCornerImageViewCornerBottom = LSCornerImageViewCornerLeftBottom | LSCornerImageViewCornerRightBottom,//左下，右下
    LSCornerImageViewCornerLeft = LSCornerImageViewCornerLeftTop | LSCornerImageViewCornerLeftBottom,//左上，左下
    LSCornerImageViewCornerRight = LSCornerImageViewCornerRightTop | LSCornerImageViewCornerRightBottom,//右上，右下
    LSCornerImageViewCornerAll = 0xffff,//全部
};

@interface LSCornerImageView : UIImageView

/**< 圆角半径 >**/
@property (nonatomic, assign) CGFloat cornerRadius;
/**< 要设置圆角的角  默认四角全部 >**/
@property (nonatomic, assign) LSCornerImageViewCorner corner;
/**< 圆角颜色 默认是白色 >**/
@property (nonatomic, strong) UIColor *cornerColor;


/**
 自定义图片的圆角以及颜色

 @param image 图片
 @param color 颜色
 @return 返回图片
 */
- (UIImage *)imageWithImage:(UIImage *)image color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
