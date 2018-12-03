//
//  Utilities.h
//  HaierSmart
//
//  Created by Vols on 16/3/7.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LSUtilities : NSObject<UIAlertViewDelegate>

+ (NSString *)emojiWithCode:(int)code;
/**
 *  @author andy, 16-03-18 14:03:07
 *
 *  弹出登录控制器
 *
 *  @param vc 需要弹出登录页面的ViewController
 */
+ (void) showLoginVC:(UIViewController *)vc;

/**
 *  @author andy, 16-04-06 10:04:07
 *
 *  转dic为json
 *
 *  @param 需要转成Str的Dic
 *
 *  @return jsonStr
 */
+ (NSString *) dictionaryToJsonStr:(NSDictionary *)dic;
/**
 *  @author andy, 16-04-06 10:04:33
 *
 *  求 Str的MD5
 *
 *  @param string Str
 *
 *  @return Str的MD5（小写）
 */
+ (NSString *) MD5WithString:(NSString *)string;
/**
 *  @author andy, 16-05-16 19:05:10
 *
 *  @brief 保存用户信息
 *
 *  @param info 用户信息
 */
+ (BOOL) hasLogin;




/**
 *  版本控制
 */
+ (void)versionCheck;

+ (BOOL)hasNewVersionWithNowVersion:(NSString *)nowVersion newVersion:(NSString *)newVersion;


//
///**
// *  全局方法集，直接调用
// *
// */
//
///* pushAction */
//extern void pushViewController(UIViewController *VC,UIViewController *sencondVC);
///* presentAction */
//extern void presentViewController(UIViewController *VC,UIViewController *sencondVC);
/* 展示HUD ，无文本*/
extern void showHUD(void);
/* 展示HUD，带文本 */
extern void showHUDWithString(NSString *string);
/* 展示HUD，只有文本 */
extern void showHUDWithOnlyText(UIViewController *VC, NSString *textStr);
/* 展示成功状态HUD */
extern void showHUDWithSuccessString(NSString *string);
/* 展示失败状态HUD */
extern void showHUDWithErrorString(NSString *string);
/* 展示提示文本HUD，（感叹号） */
extern void showHUDWithInfoString(NSString *string);
/* 展示加载进度HUD，带文本 */
extern void showHUDWithProgressAndString(CGFloat progress, NSString *string);
/* 展示自定义图片HUD，带文本 */
extern void showHUDWithImageAndString(UIImage *image ,NSString *string);
/* 隐藏HUD */
extern void dismissHUD(void);
///* 延时执行 */
//extern void dismissHUDWithDelay(NSTimeInterval timeInterval,HECompleteBlock block);
/* 隐藏键盘 */
extern void closeKeyboard(void);
///* 弹出登陆界面 */
//extern void presentLoginViewController(UIViewController *VC);
///* 设置HUD的状态 */
//extern void defaultMaskTypeHUD(SVProgressHUDMaskType maskType);
//
//extern void hiddenHEloading();
//
//extern BOOL isEqul(NSString *obj1,NSString *obj2);




@end
