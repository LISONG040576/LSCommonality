//
//  Utilities.m
//  HaierSmart
//
//  Created by Vols on 16/3/7.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "LSUtilities.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <CommonCrypto/CommonDigest.h>


#define EMOJI_CODE_TO_SYMBOL(x) ((((0x808080F0 | (x & 0x3F000) >> 4) | (x & 0xFC0) << 10) | (x & 0x1C0000) << 18) | (x & 0x3F) << 24);


@implementation LSUtilities

+ (NSString *)emojiWithCode:(int)code {
    int sym = EMOJI_CODE_TO_SYMBOL(code);
    return [[NSString alloc] initWithBytes:&sym length:sizeof(sym) encoding:NSUTF8StringEncoding];
}

+ (void) showLoginVC:(UIViewController *)vc {
    
}

+ (NSString *)dictionaryToJsonStr:(NSDictionary *)dic {
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSString *) MD5WithString:(NSString *)string {
    
    const char* original_str = [string UTF8String];
    unsigned char digist[CC_MD5_DIGEST_LENGTH]; //CC_MD5_DIGEST_LENGTH = 16
    CC_MD5(original_str, strlen(original_str), digist);
    NSMutableString* outPutStr = [NSMutableString stringWithCapacity:10];
    for(int  i =0; i<CC_MD5_DIGEST_LENGTH;i++){
        [outPutStr appendFormat:@"%02x", digist[i]];//小写x表示输出的是小写MD5，大写X表示输出的是大写MD5
    }
    return outPutStr;
}



+ (BOOL) hasLogin; {
    
    if (nil != [[NSUserDefaults standardUserDefaults] stringForKey:@""]) {
        return true;
    } else {
        return false;
    }
}





/**
 *  判断是否是手机号码
 *
 *  @param numberStr 传入的手机号码
 *
 *  @return 返回布尔值
 */
+ (BOOL)isPhoneNumberWithString:(NSString *)numberStr{
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
+ (BOOL)isBankCardNumberWithString:(NSString *)numberStr{
    
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
+ (BOOL)isPureInt:(NSString *)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    int val;
    
    return [scan scanInt:&val] && [scan isAtEnd];
}



+ (void)versionCheck
{
//    NSString *nowVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
//    [[XCHttpRequest shareInstance].url(@"http://itunes.apple.com/lookup?id=1118813638") requestTaskWithSuccess:^(id result) {
//        if ([[result allKeys] containsObject:@"results"]) {
//           NSArray *array = [result objectForKey:@"results"];
//            if (array.count > 0) {
//                NSDictionary *dict = array[0];
//                if ([[dict allKeys] containsObject:@"version"]) {
//                    NSString *newVersion = [dict objectForKey:@"version"];
//                    NSLog(@"--------nowVersion:%@    -----newVersion:%@", nowVersion, newVersion);
//                    if ([self hasNewVersionWithNowVersion:nowVersion newVersion:newVersion]) {
//                        NSString *releaseNotes = @"";
//                        if ([[dict allKeys] containsObject:@"releaseNotes"]) {
//                            releaseNotes = [dict objectForKey:@"releaseNotes"];
//                        }
//                        if ([releaseNotes rangeOfString:@"闪退"].location != NSNotFound) {
//                            UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"有新版本啦" message:@"更炫更快更好用，快去更新吧！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                            av.tag = 0;
//                            [av show];
//                        }else{
//                            UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"有新版本啦" message:@"更炫更快更好用，快去更新吧！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"更新", nil];
//                            av.tag = 1;
//                            [av show];
//                        }
//                    }
//                }
//            }
//        }
//    } fail:^(NSError *error) {
//        ;
//    }];
}

+ (BOOL)hasNewVersionWithNowVersion:(NSString *)nowVersion newVersion:(NSString *)newVersion
{
    NSArray *nowArray = [nowVersion componentsSeparatedByString:@"."];
    NSArray *newArray = [newVersion componentsSeparatedByString:@"."];
    if (nowArray.count != 3 || newArray.count != 3) {
        return NO;
    }
    
    if ([nowArray[0] integerValue] < [newArray[0] integerValue]) {
        return YES;
    }else if ([nowArray[0] isEqualToString:newArray[0]]){
        if ([nowArray[1] integerValue] < [newArray[1] integerValue]) {
            return YES;
        }else if ([nowArray[1] isEqualToString:newArray[1]]){
            if ([nowArray[2] integerValue] < [newArray[2] integerValue]) {
                return YES;
            }
        }
    }
    
    return NO;
}





//
//extern void pushViewController(UIViewController *VC,UIViewController *sencondVC){
//    sencondVC.hidesBottomBarWhenPushed = YES;
//    if ([VC isKindOfClass:[UINavigationController class]]) {
//        [(UINavigationController *)VC pushViewController:sencondVC animated:YES];
//    }else{
//        [VC.navigationController pushViewController:sencondVC animated:YES];
//    }
//}
//
////extern void pushLoginViewController(UIViewController *VC){
////    pushViewController(VC, [[HELoginController alloc] init]);
////}
//
//extern void presentLoginViewController(UIViewController *VC){
////    HELoginController *sendVC = [[HELoginController alloc] init];
////    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sendVC];
////    [VC.navigationController presentViewController:nav animated:YES completion:nil];
//
//}
//extern void presentViewController(UIViewController *VC,UIViewController *sencondVC){
//    [VC presentViewController:sencondVC animated:YES completion:nil];
//}
extern void defaultMaskTypeHUD(SVProgressHUDMaskType maskType) {
    [SVProgressHUD setDefaultMaskType:maskType];
}
extern void showHUD(){
    [SVProgressHUD show];
}
extern void showHUDWithString(NSString *string){
    [SVProgressHUD showWithStatus:string];
}

extern void showHUDWithSuccessString(NSString *string){
    [SVProgressHUD showSuccessWithStatus:string];
}

extern void showHUDWithErrorString(NSString *string){
    [SVProgressHUD showErrorWithStatus:string];
}

extern void showHUDWithInfoString(NSString *string){
    [SVProgressHUD showInfoWithStatus:string];
}

extern void showHUDWithProgressAndString(CGFloat progress, NSString *string){
    [SVProgressHUD showProgress:progress status:string];
}

extern void showHUDWithImageAndString(UIImage *image ,NSString *string){
    [SVProgressHUD showImage:image status:string];
}

extern void dismissHUD(){
    [SVProgressHUD dismiss];
}

extern void closeKeyboard(){
    //关闭键盘
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}


extern BOOL isEqul(NSString *obj1,NSString *obj2){
    if ([obj1 isEqualToString:obj2]) {
        return YES;
    }
    return NO;
}




//extern void dismissHUDWithDelay(NSTimeInterval timeInterval,HECompleteBlock block){
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [SVProgressHUD dismiss];
//            block();
//        });
//    });
//}

@end
