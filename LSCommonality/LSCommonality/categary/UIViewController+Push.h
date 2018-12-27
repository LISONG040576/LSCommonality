//
//  UIViewController+push.h
//  Test
//
//  Created by WhenWe on 2018/12/26.
//  Copyright © 2018 Haier. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HEViewControlllerTurnType) {
    HEViewControlllerTurnTypePush,
    HEViewControlllerTurnTypePresent,
};

@interface UIViewController (Push)

@property (nonatomic, strong) NSMutableDictionary *params;//参数
@property (nonatomic, copy) void (^callBack)(NSDictionary *callBackParams);//回调

/**
 几个页面向这个页面传的参数
 
 @discussion 与`popToViewController:params:animation`配合使用
 */
@property (nonatomic, strong) NSMutableDictionary *backParams;

- (void)turnToViewController:(NSString *)viewControllerString params:(nullable NSMutableDictionary *)paramDic callBack:(nullable void(^)(NSDictionary *callBackParams))callBack turnType:(HEViewControlllerTurnType)turnType animation:(BOOL)animation;


- (void)backAnimation:(BOOL)animation;



@end

NS_ASSUME_NONNULL_END
