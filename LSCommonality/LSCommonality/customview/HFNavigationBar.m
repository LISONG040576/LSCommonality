//
//  HFNavigationBar.m
//  LSCommonality
//
//  Created by 李松 on 2018/12/28.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "HFNavigationBar.h"

@interface HFNavigationBar ()





@end

@implementation HFNavigationBar


- (void)layoutViews{
    [self createSubView];
}

- (void)createSubView{
    
    self.baseHorizonLine.backgroundColor = [UIColor whiteColor];
    [self.baseHorizonLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    
    self.baseMainLabel.font = Font(18);
    self.baseMainLabel.textColor = [UIColor blackColor];
//    self.baseMainLabel.backgroundColor = [UIColor orangeColor];
    [self.baseMainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_lessThanOrEqualTo(kSCREEN_SIZE.width - 200);
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(KNewFitNavigation(20)/2);
        
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(KNewFitNavigation(20)/2);
        
    }];
    
    
    [self.secondButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backButton.mas_right);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(KNewFitNavigation(20)/2);
        
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(KNewFitNavigation(20)/2);
    }];
    
    [self.thirdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightButton.mas_left);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(KNewFitNavigation(20)/2);
    }];
    
    
    
}










- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_backButton setImage:ImageWithName(@"newBackIcon") forState:(UIControlStateNormal)];
        [self addSubview:_backButton];
    }
    return _backButton;
}

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        [_rightButton setImage:ImageWithName(@"newBackIcon") forState:(UIControlStateNormal)];
//        [_rightButton setTitle:@"分享" forState:(UIControlStateNormal)];
        [_rightButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _rightButton.titleLabel.font = Font(13);
        [self addSubview:_rightButton];
    }
    return _rightButton;
}

- (UIButton *)secondButton{
    if (!_secondButton) {
        _secondButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//                [_secondButton setImage:ImageWithName(@"web_close_icon") forState:(UIControlStateNormal)];
//        [_secondButton setTitle:@"分享" forState:(UIControlStateNormal)];
        [_secondButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _secondButton.titleLabel.font = Font(13);
        [self addSubview:_secondButton];
    }
    return _secondButton;
}

- (UIButton *)thirdButton{
    if (!_thirdButton) {
        _thirdButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        //        [_thirdButton setImage:ImageWithName(@"newBackIcon") forState:(UIControlStateNormal)];
//        [_thirdButton setTitle:@"刷新" forState:(UIControlStateNormal)];
        [_thirdButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _thirdButton.titleLabel.font = Font(13);
        [self addSubview:_thirdButton];
    }
    return _thirdButton;
}




@end
