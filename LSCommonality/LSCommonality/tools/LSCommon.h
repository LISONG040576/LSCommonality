//
//  LSCommon.h
//  LSCommonality
//
//  Created by 海尔智能-李松 on 2018/12/4.
//  Copyright © 2018 lisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//打印替换
#define NSLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);

//颜色 -
#define kRGB(r, g, b)        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//主颜色
#define MAIN_COLOR   COLOR_HEX(@"8bc638")
#define USER_DEFAULT            [NSUserDefaults standardUserDefaults]
#define USER_DEFAULT_SET(obj,key)       [USER_DEFAULT setObject:obj forKey:key];\
[USER_DEFAULT synchronize];


#define USER_DEFAULT_GET(key)       [USER_DEFAULT objectForKey:key];

//16进制字符串 颜色 @"ffffff" 或 @"0xffffff"
#define COLOR_HEX(hexStr)    [UIColor colorWithRed:((strtoul([hexStr UTF8String],0,16)>>16)&0xFF)/255.0f green:((strtoul([hexStr UTF8String],0,16)>>8)&0xFF)/255.0f blue:(strtoul([hexStr UTF8String],0,16)&0xFF)/255.0f alpha:1.0f]
#define COLOR_HEX_ALPHA(hexStr, alphaValue)    [UIColor colorWithRed:((strtoul([hexStr UTF8String],0,16)>>16)&0xFF)/255.0f green:((strtoul([hexStr UTF8String],0,16)>>8)&0xFF)/255.0f blue:(strtoul([hexStr UTF8String],0,16)&0xFF)/255.0f alpha:alphaValue]

//宽高获取
#define kSCREEN_SIZE  [UIScreen mainScreen].bounds.size

//自适应全面屏导航高度
#define KNewFitNavigationHeight     (kSCREEN_SIZE.height >= 812 ? (64 + 24) : 64)
#define KNewFitTabBarHeight     (kSCREEN_SIZE.height >= 812 ? (49 + 24) : 49)
#define KNewFitNavigation(a)     (kSCREEN_SIZE.height >= 812 ? (a + 24) : a)

/*按屏幕大小等比缩放 */
#define ScaleFloat(x) x * kSCREEN_SIZE.width / 320
#define ScaleFloat_375(x) ((x) * kSCREEN_SIZE.width / 375)   //按4.7寸为标准 按比例计算空间尺寸

//字体设置
#define Font(a)     [UIFont fontWithName:@"HelveticaNeue" size:(kSCREEN_SIZE.width == 320 ? a : (kSCREEN_SIZE.width == 375 ? a + 1 : a + 2))]
#define FontBold(a) [UIFont boldSystemFontOfSize:(kSCREEN_SIZE.width == 320 ? a : (kSCREEN_SIZE.width == 375 ? a + 1 : a + 2))]
#define Font_MN(a) [UIFont fontWithName:@"Lao Sangam MN" size:(kSCREEN_SIZE.width == 320 ? a : (kSCREEN_SIZE.width == 375 ? a + 1 : a + 2))]
//图片创建
#define ImageWithName(imageName) [UIImage imageNamed:imageName]

//数字转字符串
#define  StringWithNum(type,num) [NSString stringWithFormat:type,num]

// URL
#define  URLWithString(urlString) [NSURL URLWithString:urlString]

//机型判断 -
#define iPhone4s    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


/**
 RGB全局函数定义
 
 @param red 0 - 255
 @param green 0 - 255
 @param blue 0 - 255
 @param alpha 0 - 1.0
 @return UIColor
 */
FOUNDATION_EXPORT UIColor * RGBColor(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

/**
 hex色值获取颜色
 
 @param hexStr hex色值
 @return UIColor
 */
FOUNDATION_EXPORT UIColor * UIColorWithHexString(NSString *hexStr);
FOUNDATION_EXPORT UIColor * UIColorWithHexStringAndAlpha(NSString *hexStr, CGFloat alpha);


NS_ASSUME_NONNULL_BEGIN

@interface LSCommon : NSObject

@end

NS_ASSUME_NONNULL_END
