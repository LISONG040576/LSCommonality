//
//  ShowWebViewController.m
//  HaierSmart
//
//  Created by Vols on 16/3/3.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "LSBaseWebViewController.h"
#import "LSCommons.h"
#import <SDAutoLayout/UIView+SDAutoLayout.h>
#import "LSWebViewLoadingView.h"

@interface LSBaseWebViewController () <WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, copy) NSString *initializationUrlStr;

@property(nonatomic,strong) LSWebViewLoadingView *loadingPressView;


@end

@implementation LSBaseWebViewController{
    
    UIButton *_shareBtn;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self displayUI];
    
    NSLog(@"title --> %@, url --> %@", _theTitle, _theURL);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.noDataImageView.hidden = YES;
    
    if (self.showNaviBar) {
       
    }else{
        
        
    }
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_SIZE.width, 20)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.fristPageShowNaviBar) {
//        self.navigationController.navigationBar.hidden = NO;
    }else{
//        self.navigationController.navigationBar.hidden = YES;
    }
}

- (void)displayUI{
    
    self.title = _theTitle;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    
    NSURL *url = [NSURL URLWithString:[self.theURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
  
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(OC2JS) name:@"oc2js_Data" object:nil];
    
    
    /** 加载进度条 **/
    self.loadingPressView = [[LSWebViewLoadingView alloc] initWithFrame:CGRectMake(0, 64, kSCREEN_SIZE.width, 1.5)];
    self.loadingPressView.lineColor = [UIColor orangeColor];
    if (!self.notShowLoadPross) {
        [self.view addSubview:self.loadingPressView];
    }
    
    
    
    UIScrollView *scrollView = self.webView.scrollView;
    
    for (int i =0; i < scrollView.subviews.count ; i++) {
        UIView *view = [scrollView.subviews objectAtIndex:i];
        if ([view isKindOfClass:[UIImageView class]]) {
            view.hidden =YES ;
        }
    }
    
    /** 自定义导航 **/
    [self showCustomBackBtn];
    [self showCustomTitleView];
}




- (WKWebView *)webView{
    if (_webView == nil) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.selectionGranularity = WKSelectionGranularityDynamic;
        config.allowsInlineMediaPlayback = YES;
        WKPreferences *preferences = [[WKPreferences alloc] init];
        preferences.javaScriptEnabled = YES;
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
        config.preferences = preferences;
        
        
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, KNewFitNavigationHeight, kSCREEN_SIZE.width, kSCREEN_SIZE.height -  KNewFitNavigationHeight) configuration:config];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.backgroundColor = [UIColor whiteColor];
        [_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
        
    }
    
    _webView.scrollView.bounces = !self.canNotScroll;
    
    return _webView;
}

//WkWebView的 回调
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView) {
            if (self.title.length < 1) {
                self.customTitleView.text = self.webView.title;
            }
        } else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}



#pragma mark - UIWebViewDelgate Methods

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@" --- web界面开始加载");
    [self.loadingPressView startLoadingAnimation];
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@" --- web界面开始返回内容");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@" --- web界面加载完成");
    
    self.noDataImageView.hidden = YES;
    [self.loadingPressView endLoadingAnimation];

    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@" --- web界面加载失败");
    
    
    [self.loadingPressView endLoadingAnimation];
    [self.view addSubview:self.noDataImageView];
    self.noDataImageView.hidden = NO;
    self.noDataImageView.centerY = self.view.centerY;
    self.noDataImageView.centerX = self.view.centerX;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@" --- web界面在请求发送之前，决定是否跳转");
    
//    decisionHandler(WKNavigationActionPolicyAllow);//允许
//    decisionHandler(WKNavigationActionPolicyCancel);//不允许
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    NSLog(@" --- web界面在收到相应之后，决定是否跳转");
//    decisionHandler(WKNavigationResponsePolicyAllow);//允许
//    decisionHandler(WKNavigationResponsePolicyCancel);//不允许
}





- (void)OC2JS{
    
   

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



    

    
// 重写返回按钮方法
- (void)goBackViewController{
    if (self.isPresent) {
        /** 如果是模态进来的 **/
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        /** 如果是push进来的 **/
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (UIImageView *)noDataImageView{
    if (!_noDataImageView) {
        _noDataImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _noDataImageView.contentMode = UIViewContentModeScaleAspectFit;
        _noDataImageView.image = ImageWithName(@"noNetWorkIcon");
    }
    
    return _noDataImageView;
}



-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_webView removeObserver:self forKeyPath:@"title"];
}

- (void)closeWebView:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
