//
//  ShowWebViewController.h
//  HaierSmart
//
//  Created by Vols on 16/3/3.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "LSBaseViewController.h"
#import <WebKit/WebKit.h>
#import "UIViewController+Push.h"
#import "LSCommon.h"


@interface LSBaseWebViewController : LSBaseViewController


/**
 不展示导航栏？？？？？
 */
@property(nonatomic,assign)BOOL notShowNavBar;

/** url **/
@property (nonatomic, strong) NSString *theURL;

/**
 *  webView
 */
@property (nonatomic, strong) WKWebView *webView;


- (void)displayUI;

@end
