/*
 ***************************************************************************
 * 类名	    ： HEBaseViewController
 * 建立日期	： 16/7/23
 * 版权声明	： 本代码版权归集团所有，禁止任何未授权的传播和使用
 * 作者		： 海尔智能-李松
 * 模块		：
 * 描述		： 定制nav
 * -------------------------------------------------------------------------
 
 ***************************************************************************
 */



#import "LSBaseViewController.h"
#import "LSCommon.h"
#import "UIView+SDAutoLayout.h"


@interface LSBaseViewController ()



@end

@implementation LSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.baseLoadingLab];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}


/**

 自定义返回按钮事件
 
 **/
- (void)goBackViewController
{
    if(self.navigationController){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}



/**
 如果加载视图有点击事件
 */
- (void)loadLabClickAction{
    
}

/**
 点击导航栏右侧按钮事件
 */
- (void)customRightButtonAction{
    
}







#pragma mark - gets / sets

- (UILabel *)baseLoadingLab{
    if (!_baseLoadingLab) {
        _baseLoadingLab = [[UILabel alloc] initWithFrame:CGRectMake(0, kSCREEN_SIZE.height / 2 - 20, kSCREEN_SIZE.width, ScaleFloat_375(60))];
        _baseLoadingLab.textColor = [UIColor lightGrayColor];
        _baseLoadingLab.text  = @"加载中...";
        _baseLoadingLab.font = Font(14);
        _baseLoadingLab.textAlignment = NSTextAlignmentCenter;
        _baseLoadingLab.hidden = YES;
        _baseLoadingLab.userInteractionEnabled = YES;

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadLabClickAction)];
        [_baseLoadingLab addGestureRecognizer:tap];
    }

    return _baseLoadingLab;
}


- (void)showCustomBackBtn{
    [self showCustomBackBtnWihtImage:ImageWithName(@"newBackIcon")];
}

- (void)showCustomBackBtnWihtImage:(UIImage *)image{
    UIButton *customBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [customBackBtn setImage:image forState:(UIControlStateNormal)];
    customBackBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    customBackBtn.frame = CGRectMake(0, KNewFitNavigation(20), 40, 40);
    [self.view addSubview:customBackBtn];
    [customBackBtn addTarget:self action:@selector(goBackViewController) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)showCustomTitleView{
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, KNewFitNavigation(20), kSCREEN_SIZE.width - 100, 40)];
    titleView.centerX = self.view.centerX;
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.text = self.title;
    self.customTitleView = titleView;
    [self.view addSubview:self.customTitleView];
}

- (void)showCustomHeaderLineViewWithColor:(UIColor *)color heigh:(CGFloat)heigh{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, KNewFitNavigationHeight - 1, kSCREEN_SIZE.width, heigh)];

    lineView.backgroundColor = color;

    [self.view addSubview:lineView];
}

- (void)showCustomTitleViewWithFontSize:(NSInteger)size textColor:(UIColor *)textColor{
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, KNewFitNavigation(20), kSCREEN_SIZE.width - 100, 40)];
    titleView.centerX = self.view.centerX;
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.text = self.title;
    titleView.textColor = textColor;
    titleView.font = Font(size);
    [self.view addSubview:titleView];
}

- (void)showCustomRightBtnWithTitle:(NSString *)title fontSize:(NSInteger)fontSize textColor:(UIColor *)textColor{
    UIButton *customRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [customRightBtn setTitle:title forState:(UIControlStateNormal)];
    customRightBtn.frame = CGRectMake(kSCREEN_SIZE.width - 80, KNewFitNavigation(20), 60, 40);
    customRightBtn.titleLabel.font = Font(fontSize);
    customRightBtn.titleLabel.numberOfLines = 0;
    [customRightBtn setTitleColor:textColor forState:(UIControlStateNormal)];
//    [customRightBtn setBackgroundColor:MainColor];

    [self.view addSubview:customRightBtn];
    [customRightBtn addTarget:self action:@selector(customRightButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//
//    return UIInterfaceOrientationMaskPortrait;
//}
//







@end
