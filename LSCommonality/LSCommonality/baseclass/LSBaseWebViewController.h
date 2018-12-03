//
//  ShowWebViewController.h
//  HaierSmart
//
//  Created by Vols on 16/3/3.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "LSBaseViewController.h"
#import <WebKit/WebKit.h>




typedef void (^LSWebViewBlock) (NSString *url);

@interface LSBaseWebViewController : LSBaseViewController

@property (nonatomic, strong) NSString *theTitle;

@property (nonatomic, strong) NSString *theURL;

@property(nonatomic,assign)BOOL isPresent;

@property(nonatomic,assign)BOOL canNotScroll;//bounds是否固定

@property(nonatomic,assign)BOOL notShowShareBtn;

@property(nonatomic,assign)BOOL showNaviBar;

@property(nonatomic,assign)BOOL fristPageShowNaviBar;

@property(nonatomic,assign)BOOL notShowLoadPross;



@property(nonatomic,copy)LSWebViewBlock webBlock;

@property(nonatomic,strong)UIImageView *noDataImageView;



/**
 *  webView
 */
@property (nonatomic, strong) WKWebView *webView;


- (void)displayUI;

@end
