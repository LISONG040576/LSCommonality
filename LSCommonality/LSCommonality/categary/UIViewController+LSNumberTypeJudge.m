//
//  UIViewController+HSNumberTypeJudge.m
//  HaierSmart
//
//  Created by 海尔智能-李松 on 16/3/26.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "UIViewController+LSNumberTypeJudge.h"

@implementation UIViewController (LSNumberTypeJudge)

/**
 *  判断是否是手机号码
 *
 *  @param numberStr 传入的手机号码
 *
 *  @return 返回布尔值
 */
- (BOOL)isPhoneNumberWithString:(NSString *)numberStr{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    //    NSString * MOBILE = @"^1((3//d|5[0-35-9]|8[025-9])//d|70[059])\\d{7}$";//总况
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17         */
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22         */
    NSString * CT = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";
    
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    
    if (([regextestcm evaluateWithObject:numberStr] == YES)
        || ([regextestct evaluateWithObject:numberStr] == YES)
        || ([regextestcu evaluateWithObject:numberStr] == YES)
        || ([regextestphs evaluateWithObject:numberStr] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


/**
 *  判断是否是银行卡号
 *
 *  @param numberStr 传入的银行卡号
 *
 *  @return 返回布尔值
 */
- (BOOL)isBankCardNumberWithString:(NSString *)numberStr{
    
    if (![self isPureInt:numberStr]) {
        //如果不是纯数字
        return NO;
    }
    
    //进行卢恩算法
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[numberStr length];
    
    int lastNum = [[numberStr substringFromIndex:cardNoLength-1] intValue];
    
    numberStr = [numberStr substringToIndex:cardNoLength - 1];
    
    for (int i = cardNoLength -1 ; i>=1;i--) {
        
        NSString *tmpString = [numberStr substringWithRange:NSMakeRange(i-1, 1)];
        
        int tmpVal = [tmpString intValue];
        
        if (cardNoLength % 2 ==1 ) {
            
            if((i % 2) == 0){
                
                tmpVal *= 2;
                
                if(tmpVal>=10)
                    
                    tmpVal -= 9;
                
                evensum += tmpVal;
                
            }else{
                
                oddsum += tmpVal;
            }
        }else{
            
            if((i % 2) == 1){
                
                tmpVal *= 2;
                
                if(tmpVal>=10)
                    
                    tmpVal -= 9;
                
                evensum += tmpVal;
                
            }else{
                
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    
    allsum += lastNum;
    
    if((allsum % 10) == 0)
        
        return YES;
    else
        return NO;
}

//判断字符串是否是纯数字
- (BOOL)isPureInt:(NSString *)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    int val;
    
    return [scan scanInt:&val] && [scan isAtEnd];
}

@end
