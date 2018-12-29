//
//  ViewController.m
//  LSCommonality
//
//  Created by 海尔智能-李松 on 2018/11/30.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSCommonViewController.h"
#import "UIViewController+Push.h"
#import "HFNavigationBar.h"

@interface LSCommonViewController ()

@end

@implementation LSCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"首页测试";
    [self hiddenCustomBackButton];
    [self showLoadingLabWithText:@"点击任意地方调转BaseWebViewController"];
    
    
    
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self turnToViewController:@"LSBaseWebViewController"
                        params:[NSMutableDictionary dictionaryWithDictionary:@{@"webUrlStr":@"https://www.baidu.com",
                                                                               @"notShowNavBar":@"0"
                                                                               }]
                      callBack:^(NSDictionary * _Nonnull callBackParams) {
    }
                      turnType:HEViewControlllerTurnTypePresent
                     animation:YES];
    

}


@end
