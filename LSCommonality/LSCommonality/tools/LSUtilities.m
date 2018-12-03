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
    return [outPutStr lowercaseString];
}



+ (BOOL) hasLogin; {
    
    if (nil != [[NSUserDefaults standardUserDefaults] stringForKey:@""]) {
        return true;
    } else {
        return false;
    }
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
