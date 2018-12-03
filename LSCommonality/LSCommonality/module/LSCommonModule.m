//
//  LSCommonModule.m
//  LSCommonality
//
//  Created by 海尔智能-李松 on 2018/12/3.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSCommonModule.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation LSCommonModule

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    
    NSLog(@"--- LSCommon 模块启动完成");
    
    /* 配置HUD信息 */
    [self configSVProgressHUD];
    
    return YES;
}



/**
 *  配置HUD信息
 */
- (void)configSVProgressHUD{

    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];//设置HUD的Style
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];//设置HUD和文本的颜色
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];//设置HUD的背景颜色
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];

//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
//    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
//    [SVProgressHUD setForegroundColor:[UIColor w]];
//    [SVProgressHUD setBackgroundLayerColor:[UIColor blackColor]];
}

@end
