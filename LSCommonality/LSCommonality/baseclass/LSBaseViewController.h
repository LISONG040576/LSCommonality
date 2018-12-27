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


@interface LSBaseViewController : UIViewController

/** loading **/
@property(nonatomic,strong)UILabel *baseLoadingLab;

@property(nonatomic,strong)UILabel *customTitleView;

/**
 返回按钮
 */
@property(nonatomic,strong)UIButton *customBackBtn;

/**
 右侧按钮
 */
@property(nonatomic,strong)UIButton *customRightBtn;


/** baseLoadLab点击方法 **/
- (void)loadLabClickAction;
/* 重写返回按钮方法*/
- (void)goBackViewController;
/* 自定义返回按钮 */
- (void)showCustomBackBtn;
/** 自定义导航视图 **/
- (void)showCustomTitleView;

/**
 自定义导航视图，l颜色自定义

 @param size 文字大小
 @param textColor 文字颜色
 */
- (void)showCustomTitleViewWithFontSize:(NSInteger)size textColor:(UIColor *)textColor;


/**
 返回按钮的图片

 @param image 图片
 */
- (void)showCustomBackBtnWihtImage:(UIImage *)image;


/**
 自定义导航栏右侧按钮

 @param title 右侧按钮文字
 @param fontSize 右侧按钮文字大小
 @param textColor 右侧按钮文字颜色
 */
- (void)showCustomRightBtnWithTitle:(NSString *)title fontSize:(NSInteger)fontSize textColor:(UIColor *)textColor;

- (void)showCustomRightBtnWihtImage:(UIImage *)image;


/**
 导航右侧按钮的事件
 */
- (void)customRightButtonAction;


/**
 自定义导航下部线条

 @param color 线条颜色
 @param heigh 线条高度
 */
- (void)showCustomHeaderLineViewWithColor:(UIColor *)color heigh:(CGFloat)heigh;










@end
