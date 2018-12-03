//
//  UIViewController+HSNumberTypeJudge.h
//  HaierSmart
//
//  Created by 海尔智能-李松 on 16/3/26.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

/**
 *  数字字符串种类的判断
 *
 */

#import <UIKit/UIKit.h>

@interface UIViewController (LSNumberTypeJudge)

/**
 *  判断是否是手机号码
 *
 *  @param numberStr 传入的手机号码
 *
 *  @return 返回布尔值
 */


- (BOOL)isPhoneNumberWithString:(NSString *)numberStr;
/**
 *  判断是否是银行卡号
 *
 *  @param numberStr 传入的银行卡号
 *
 *  @return 返回布尔值
 */
- (BOOL)isBankCardNumberWithString:(NSString *)numberStr;

@end
