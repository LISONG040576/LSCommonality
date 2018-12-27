//
//  UIViewController+push.m
//  Test
//
//  Created by WhenWe on 2018/12/26.
//  Copyright © 2018 Haier. All rights reserved.
//

#import "UIViewController+Push.h"
#import <objc/runtime.h>

NSString * const UIViewController_Push_ParamsKey = @"UIViewController_Push_ParamsKey";
NSString * const UIViewController_Push_CallBackKey = @"UIViewController_Push_CallBackKey";

@implementation UIViewController (Push)

- (void)setParams:(NSMutableDictionary *)params
{
    objc_setAssociatedObject(self, &UIViewController_Push_ParamsKey, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)params
{
    return objc_getAssociatedObject(self, &UIViewController_Push_ParamsKey);
}

- (void)setCallBack:(void (^)(NSDictionary * _Nonnull))callBack
{
    objc_setAssociatedObject(self, &UIViewController_Push_CallBackKey, callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(NSDictionary * _Nonnull))callBack
{
    return objc_getAssociatedObject(self, &UIViewController_Push_CallBackKey);
}

- (void)turnToViewController:(NSString *)viewControllerString params:(nullable NSMutableDictionary *)paramDic callBack:(nullable void(^)(NSDictionary *callBackParams))callBack turnType:(HEViewControlllerTurnType)turnType animation:(BOOL)animation
{
    Class clazz = NSClassFromString(viewControllerString);
    
    if (!clazz) {
        NSLog(@"----无此Object");
        return;
    }
    
    id obj = [clazz new];
    if ([obj isKindOfClass:[UIViewController class]]) {
        UIViewController *viewController = (UIViewController *)obj;
        viewController.params = [paramDic mutableCopy];
        viewController.callBack = callBack;
        viewController.hidesBottomBarWhenPushed = YES;
        if (!turnType) {
            [self.navigationController pushViewController:viewController animated:animation];
        } else {
            [self presentViewController:viewController animated:animation completion:nil];
        }
    } else {
        NSLog(@"-----请选择BaseViewController或其子类进行跳转");
    }
}

- (void)backAnimation:(BOOL)animation
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:animation completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:animation];
    }
}

- (void)popToViewController:(NSString *)viewControllerClassString params:(NSDictionary *)params animation:(BOOL)animation
{
    Class class = NSClassFromString(viewControllerClassString);
    if (!class) {
        NSLog(@"----无此Object");
        return;
    }
    
    BOOL have = NO;
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:class]) {
            have = YES;
            controller.backParams = [params mutableCopy];
            [self.navigationController popToViewController:controller animated:animation];
            return;
        }
    }
    if (!have) {
        NSLog(@"------要跳转的页面 不在此页面的navigationController的栈内");
    }
}

@end
