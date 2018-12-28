//
//  ShowWebViewController.h
//  HaierSmart
//
//  Created by Vols on 16/3/3.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "LSBaseViewController.h"
#import <WebKit/WebKit.h>


@interface LSBaseWebViewController : LSBaseViewController

@property(nonatomic,assign)BOOL notShowNavBar;

@property (nonatomic, strong) NSString *theURL;

/**
 关闭按钮
 */
@property(nonatomic,strong)UIButton *closeBtn;

/**
 刷新按钮
 */
@property(nonatomic,strong)UIButton *refreshBtn;

/**
 分享按钮按钮
 */
@property(nonatomic,strong)UIButton *shareBtn;

/**
 *  webView
 */
@property (nonatomic, strong) WKWebView *webView;


- (void)displayUI;

@end
