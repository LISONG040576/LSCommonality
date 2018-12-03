//
//  HEWebViewLoadingView.m
//  XinXiaoChu
//
//  Created by 海尔智能-李松 on 2017/5/20.
//  Copyright © 2017年 海尔智能-李松. All rights reserved.
//

#import "LSWebViewLoadingView.h"
#import "LSCommons.h"
#import "UIViewExt.h"

@implementation LSWebViewLoadingView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.backgroundColor = lineColor;
}

-(void)startLoadingAnimation{
    self.hidden = NO;
    self.width = 0.0;
    
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.width = kSCREEN_SIZE.width * 0.6;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.width = kSCREEN_SIZE.width * 0.8;
        }];
    }];
    
    
}

-(void)endLoadingAnimation{
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.width = kSCREEN_SIZE.width;
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
