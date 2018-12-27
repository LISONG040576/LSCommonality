//
//  ViewController.m
//  LSCommonality
//
//  Created by 海尔智能-李松 on 2018/11/30.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSCommonViewController.h"
#import "UIViewController+Push.h"

@interface LSCommonViewController ()

@end

@implementation LSCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak LSCommonViewController *weakVC = self;
    [[NSTimer scheduledTimerWithTimeInterval:10 * 60 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        if (weakVC.view.backgroundColor == [UIColor whiteColor]) {
            weakVC.view.backgroundColor = [UIColor blueColor];
        }else{
            weakVC.view.backgroundColor = [UIColor whiteColor];
        }
        
        
    }] fire] ;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self turnToViewController:@"LSBaseWebViewController"
                        params:[NSMutableDictionary
                                dictionaryWithDictionary:@{@"webUrlStr":@"https://www.baidu.com"}]
                      callBack:^(NSDictionary * _Nonnull callBackParams) {
        
    } turnType:(HEViewControlllerTurnTypePresent) animation:YES];
    

}


@end
