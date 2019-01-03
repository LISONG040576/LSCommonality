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

#import "HFNavigationBar.h"


@interface LSBaseViewController ()



@end

@implementation LSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBarHidden = YES;
    
    [self.view addSubview:self.baseLoadingLab];
    
//    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    
    [self showCustomNavigationBar];
    
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
    if(!self.presentingViewController){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        if (self.navigationController) {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}









/**
 展示自带加载view
 */
- (void)showLoadingLab{
    self.baseLoadingLab.hidden = NO;
}
/**
 展示自带加载viewd自定义文字
 */
- (void)showLoadingLabWithText:(NSString *)text{
    self.baseLoadingLab.hidden = NO;
    self.baseLoadingLab.text = text;
}
/**
 隐藏关闭自带的加载view
 */
- (void)closeLoadingLab{
    self.baseLoadingLab.hidden = YES;
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

/**
 返回按钮旁边的按钮的点击事件
 */
- (void)secondButtonAction{
    
}

/**
 最右侧按钮旁边的按钮事件
 */
- (void)thirdButtonAction{
    
}


- (void)hiddenCustomBackButton{
    self.navigationBar.backButton.hidden = YES;
}

- (void)setTitle:(NSString *)title{
    
    [super setTitle:title];
    self.navigationBar.baseMainLabel.text = title;
}

- (void)showCustomNavigationBarBottomLineWithColor:(UIColor *)lineColor{
    self.navigationBar.baseHorizonLine.backgroundColor = lineColor;
}

- (void)showCustomNavigationBar{
    [self showCustonNavigationBarWithBackgroundColor:nil TitleSize:0 titleColor:nil  backImage:nil rightTitle:nil rightTitleSize:0 rightTitleColor:nil rightImage:nil secondTitle:nil secondTitleSize:0 secondTitleColor:nil secondImage:nil thirdTitleSize:0 thirdTitleColor:nil thirdImage:nil];
}

- (void)showCustomNavigationBarWithBackImage:(UIImage *)backImage{
    [self showCustonNavigationBarWithBackgroundColor:nil TitleSize:0 titleColor:nil  backImage:backImage rightTitle:nil rightTitleSize:0 rightTitleColor:nil rightImage:nil secondTitle:nil secondTitleSize:0 secondTitleColor:nil secondImage:nil thirdTitleSize:0 thirdTitleColor:nil thirdImage:nil];
}

- (void)showCustomNavigationBarWithRightTitle:(NSString *)rightTitle rightSize:(NSInteger)rightSize rightColor:(UIColor *)rightColor{
    [self showCustonNavigationBarWithBackgroundColor:nil TitleSize:0 titleColor:nil  backImage:nil rightTitle:rightTitle rightTitleSize:rightSize rightTitleColor:rightColor rightImage:nil secondTitle:nil secondTitleSize:0 secondTitleColor:nil secondImage:nil thirdTitleSize:0 thirdTitleColor:nil thirdImage:nil];
}

- (void)showCustomNavigationBarWithSecondTitle:(NSString *)secondTitle secondSize:(NSInteger)secondSize secondColor:(UIColor *)secondColor{
    [self showCustonNavigationBarWithBackgroundColor:nil TitleSize:0 titleColor:nil  backImage:nil rightTitle:nil rightTitleSize:0 rightTitleColor:nil rightImage:nil secondTitle:secondTitle secondTitleSize:secondSize secondTitleColor:secondColor secondImage:nil thirdTitleSize:0 thirdTitleColor:nil thirdImage:nil];
}

- (void)showCustomNavigationBarWithRightImage:(UIImage *)rightImage{
    [self showCustonNavigationBarWithBackgroundColor:nil TitleSize:0 titleColor:nil  backImage:nil rightTitle:nil rightTitleSize:0 rightTitleColor:nil rightImage:rightImage secondTitle:nil secondTitleSize:0 secondTitleColor:nil secondImage:nil thirdTitleSize:0 thirdTitleColor:nil thirdImage:nil];
}

- (void)showCustomNavigationBarWithSecondImage:(UIImage *)secondImage{
    [self showCustonNavigationBarWithBackgroundColor:nil TitleSize:0 titleColor:nil  backImage:nil rightTitle:nil rightTitleSize:0 rightTitleColor:nil rightImage:nil secondTitle:nil secondTitleSize:0 secondTitleColor:nil secondImage:secondImage thirdTitleSize:0 thirdTitleColor:nil thirdImage:nil];
}

- (void)showCustomNavigationBarWithThirdImage:(UIImage *)ThirdImage{
    [self showCustonNavigationBarWithBackgroundColor:nil TitleSize:0 titleColor:nil  backImage:nil rightTitle:nil rightTitleSize:0 rightTitleColor:nil rightImage:nil secondTitle:nil secondTitleSize:0 secondTitleColor:nil secondImage:nil thirdTitleSize:0 thirdTitleColor:nil thirdImage:ThirdImage];
}



- (void)showCustonNavigationBarWithBackgroundColor:(UIColor *)bgColor
                                         TitleSize:(NSInteger)titleSize
                                        titleColor:(UIColor *)titleColor
                                         backImage:(UIImage *)backImage
                                        rightTitle:(NSString *)rightTitle
                                    rightTitleSize:(NSInteger)rightSize
                                   rightTitleColor:(UIColor *)rightColor
                                        rightImage:(UIImage *)rightImage
                                   secondTitle:(NSString *)secondTitle
                                   secondTitleSize:(NSInteger)secondSize
                                  secondTitleColor:(UIColor *)secondColor
                                       secondImage:(UIImage *)seconImage
                                    thirdTitleSize:(NSInteger)thirdSize
                                   thirdTitleColor:(UIColor *)thirdColor
                                        thirdImage:(UIImage *)thirdImage{
    
    
    
    self.navigationBar.baseMainLabel.text = self.title;

    
    if (bgColor) {
        self.navigationBar.backgroundColor = bgColor;
    }
    
    if (titleSize > 0) {
        self.navigationBar.baseMainLabel.font = Font(titleSize);
    }
    
    if (titleColor) {
        self.navigationBar.baseMainLabel.textColor = titleColor;
    }
    
    if (backImage) {
        [self.navigationBar.backButton setImage:backImage forState:(UIControlStateNormal)];
    }
    
    if (rightTitle) {
        [self.navigationBar.rightButton setTitle:rightTitle forState:(UIControlStateNormal)];
    }
    
    if (rightColor) {
        [self.navigationBar.rightButton setTitleColor:rightColor forState:(UIControlStateNormal)];
    }
    
    if (rightSize > 0) {
        self.navigationBar.rightButton.titleLabel.font = Font(rightSize);
    }
    
    if (rightImage) {
        [self.navigationBar.rightButton setImage:rightImage forState:(UIControlStateNormal)];
    }
    
    
    if (secondTitle) {
        [self.navigationBar.secondButton setTitle:secondTitle forState:(UIControlStateNormal)];
    }
    
    if (secondColor) {
        [self.navigationBar.rightButton setTitleColor:secondColor forState:(UIControlStateNormal)];
    }
    
    if (secondSize > 0) {
        self.navigationBar.rightButton.titleLabel.font = Font(secondSize);
    }
    
    if (seconImage) {
        [self.navigationBar.secondButton setImage:seconImage forState:(UIControlStateNormal)];
    }
    
    if (thirdColor) {
        [self.navigationBar.rightButton setTitleColor:thirdColor forState:(UIControlStateNormal)];
    }
    
    if (thirdSize > 0) {
        self.navigationBar.rightButton.titleLabel.font = Font(thirdSize);
    }
    
    if (thirdImage) {
        [self.navigationBar.thirdButton setImage:thirdImage forState:(UIControlStateNormal)];
    }
    
    
    
    [self.navigationBar.backButton addTarget:self action:@selector(goBackViewController) forControlEvents:(UIControlEventTouchUpInside)];
    [self.navigationBar.rightButton addTarget:self action:@selector(customRightButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.navigationBar.secondButton addTarget:self action:@selector(secondButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.navigationBar.thirdButton addTarget:self action:@selector(thirdButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    
}



- (void)showNavigationBgImageViewWithImageObj:(id)imageObj{
    [self.navigationBar showBgImageViewWithImageObj:imageObj];
}


- (void)changeNavigationBarThemeForWhite:(BOOL)isWhtie{
    
    if (!isWhtie) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        self.navigationBar.baseMainLabel.textColor = [UIColor blackColor];
        [self showCustomNavigationBarWithBackImage:ImageWithName(@"newBackIcon")];
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        self.navigationBar.baseMainLabel.textColor = [UIColor whiteColor];
        [self showCustomNavigationBarWithBackImage:ImageWithName(@"newBackIcon_W")];
    }
    
}







#pragma mark - gets / sets

- (HFNavigationBar *)navigationBar{
    if (!_navigationBar) {
        _navigationBar = [[HFNavigationBar alloc] init];
        [self.view addSubview:_navigationBar];
    }
    
    [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(KNewFitNavigationHeight);
    }];
    
    return _navigationBar;
}

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











@end
