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

@property(nonatomic,copy)LSWebViewBlock webBlock;

@property(nonatomic,strong)UIImageView *noDataImageView;



/**
 *  webView
 */
@property (nonatomic, strong) WKWebView *webView;


- (void)displayUI;

@end
