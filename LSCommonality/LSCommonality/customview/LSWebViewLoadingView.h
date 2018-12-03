//
//  HEWebViewLoadingView.h
//  XinXiaoChu
//
//  Created by 海尔智能-李松 on 2017/5/20.
//  Copyright © 2017年 海尔智能-李松. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSWebViewLoadingView : UIView

//进度条颜色
@property (nonatomic,strong) UIColor  *lineColor;

//开始加载
-(void)startLoadingAnimation;

//结束加载
-(void)endLoadingAnimation;

@end
