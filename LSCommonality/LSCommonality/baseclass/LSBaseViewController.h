/*
 ***************************************************************************
 * 类名	    ： HEBaseViewController
 * 建立日期	： 16/7/23
 * 版权声明	： 本代码版权归集团所有，禁止任何未授权的传播和使用
 * 作者		： 海尔智能-李松
 * 模块		：
 * 描述		： 定制nav
 * -------------------------------------------------------------------------
 
 ***************************************************************************
 */

#import <UIKit/UIKit.h>



@class HFNavigationBar;
@interface LSBaseViewController : UIViewController

/** loading view **/
@property(nonatomic,strong)UILabel *baseLoadingLab;

/** 自定义导航栏 **/
@property(nonatomic,strong)HFNavigationBar *navigationBar;



/**
 展示自带加载view
 */
- (void)showLoadingLab;
/**
 展示自带加载viewd自定义文字
 */
- (void)showLoadingLabWithText:(NSString *)text;
/**
 隐藏关闭自带的加载view
 */
- (void)closeLoadingLab;
/**
 baseLoadLab点击方法 --- (子类复写)
 **/
- (void)loadLabClickAction;
/*
 重写返回按钮方法 --- (子类复写)
 */
- (void)goBackViewController;
/**
 导航右侧按钮的事件 --- (子类复写)
 */
- (void)customRightButtonAction;
/**
 返回按钮旁边的按钮的点击事件 --- (子类复写)
 */
- (void)secondButtonAction;

/**
 最右侧按钮旁边的按钮事件 --- (子类复写)
 */
- (void)thirdButtonAction;

/**
显示默认的导航栏
 */
- (void)showCustomNavigationBar;

/**
 隐藏导航栏返回按钮
 */
- (void)hiddenCustomBackButton;

/**
 显示导航栏底部的横线

 @param lineColor 横线颜色
 */
- (void)showCustomNavigationBarBottomLineWithColor:(UIColor *)lineColor;

/**
 自定义返回按钮图片

 @param backImage 图片
 */
- (void)showCustomNavigationBarWithBackImage:(UIImage *)backImage;

/**
 自定义最右侧按钮

 @param rightTitle 文字内容
 @param rightSize 文字大小
 @param rightColor 文字颜色
 */
- (void)showCustomNavigationBarWithRightTitle:(NSString *)rightTitle rightSize:(NSInteger)rightSize rightColor:(UIColor *)rightColor;

/**
 自定义返回按钮旁边的按钮

 @param secondTitle 内容
 @param secondSize 字体
 @param secondColor 颜色
 */
- (void)showCustomNavigationBarWithSecondTitle:(NSString *)secondTitle secondSize:(NSInteger)secondSize secondColor:(UIColor *)secondColor;

/**
 自定义最右侧按钮的图片

 @param rightImage 图片
 */
- (void)showCustomNavigationBarWithRightImage:(UIImage *)rightImage;

/**
 自定义a返回按钮帮拜年按钮的图片

 @param secondImage 图片
 */
- (void)showCustomNavigationBarWithSecondImage:(UIImage *)secondImage;

/**
 自定义最右侧按钮傍边的按钮的图片

 @param ThirdImage 图片
 */
- (void)showCustomNavigationBarWithThirdImage:(UIImage *)ThirdImage;

    


/**
 全量自定导航栏配置方法

 @param bgColor 导航栏背景颜色
 @param titleSize 导航栏标题字体大小
 @param titleColor 标题颜色
 @param backImage 返回按钮图片
 @param rightSize 最右侧按钮的w字体大小
 @param rightColor 最右侧按钮的文字颜色
 @param rightImage 最右侧按钮图片
 @param secondSize 与返回按钮相邻按钮的字体大小
 @param secondColor 与返回按钮相邻按钮的字体颜色
 @param seconImage 与返回按钮相邻按钮图片
 @param thirdSize 与最右侧按钮相邻按钮
 @param thirdColor 与最右侧按钮相邻按钮
 @param thirdImage 与最右侧按钮相邻按钮
 */
- (void)showCustonNavigationBarWithBackgroundColor:(UIColor *)bgColor
                                         TitleSize:(NSInteger)titleSize
                                        titleColor:(UIColor *)titleColor
                                         backImage:(UIImage *)backImage
                                        rightTitle:(NSString *)rightTitle
                                    rightTitleSize:(NSInteger)rightSize
                                   rightTitleColor:(UIColor *)rightColor
                                        rightImage:(UIImage *)rightImage
                                       secondTitle:(NSString *)secondTitle
                                   secondTitleSize:(NSInteger)secondSize
                                  secondTitleColor:(UIColor *)secondColor
                                       secondImage:(UIImage *)seconImage
                                    thirdTitleSize:(NSInteger)thirdSize
                                   thirdTitleColor:(UIColor *)thirdColor
                                        thirdImage:(UIImage *)thirdImage;


/**
 展示导航背景图片
 
 @param imageObj 图片对象，可以是Image，也可以是URL string
 */
- (void)showNavigationBgImageViewWithImageObj:(id)imageObj;



/**
 修改导航栏的主题颜色

 */
- (void)changeNavigationBarThemeForWhite:(BOOL)isWhtie;



@end
