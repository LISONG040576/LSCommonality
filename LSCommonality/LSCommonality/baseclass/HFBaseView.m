//
//  HFBaseView.m
//  Test
//
//  Created by WhenWe on 2018/12/26.
//  Copyright © 2018 Haier. All rights reserved.
//

#import "HFBaseView.h"

@interface HFBaseView ()

@property (nonatomic, strong) UILabel *baseLabel;//
@property (nonatomic, strong) UILabel *baseMainLabel;//
@property (nonatomic, strong) UILabel *baseSubMainLabel;//
@property (nonatomic, strong) UILabel *baseDetailLabel;//
@property (nonatomic, strong) UILabel *baseSubDetailLabel;//

@property (nonatomic, strong) UIImageView *baseIV;//
@property (nonatomic, strong) UIImageView *baseMainIV;//

@property (nonatomic, strong) UIView *baseHorizonLine;//

@end

@implementation HFBaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self layoutViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutViews];
    }
    return self;
}

- (void)layoutViews
{
    
}

- (UILabel *)baseLabel
{
    if (!_baseLabel) {
        _baseLabel = [[UILabel alloc] init];
        _baseLabel.textColor = [UIColor blackColor];
        _baseLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_baseLabel];
    }
    return _baseLabel;
}

- (UILabel *)baseMainLabel
{
    if (!_baseMainLabel) {
        _baseMainLabel = [[UILabel alloc] init];
        _baseMainLabel.textColor = [UIColor lightGrayColor];
        _baseMainLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_baseMainLabel];
    }
    return _baseMainLabel;
}

- (UILabel *)baseSubMainLabel
{
    if (!_baseSubMainLabel) {
        _baseSubMainLabel = [[UILabel alloc] init];
        _baseSubMainLabel.textColor = [UIColor lightGrayColor];
        _baseSubMainLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_baseSubMainLabel];
    }
    return _baseSubMainLabel;
}

- (UILabel *)baseDetailLabel
{
    if (!_baseDetailLabel) {
        _baseDetailLabel = [[UILabel alloc] init];
        _baseDetailLabel.textColor = [UIColor lightGrayColor];
        _baseDetailLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_baseDetailLabel];
    }
    return _baseDetailLabel;
}

- (UILabel *)baseSubDetailLabel
{
    if (!_baseSubDetailLabel) {
        _baseSubDetailLabel = [[UILabel alloc] init];
        _baseSubDetailLabel.textColor = [UIColor lightGrayColor];
        _baseSubDetailLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_baseSubDetailLabel];
    }
    return _baseSubDetailLabel;
}

- (UIImageView *)baseIV
{
    if (!_baseIV) {
        _baseIV = [[UIImageView alloc] init];
        [self addSubview:_baseIV];
    }
    return _baseIV;
}

- (UIImageView *)baseMainIV
{
    if (!_baseMainIV) {
        _baseMainIV = [[UIImageView alloc] init];
        [self addSubview:_baseMainIV];
    }
    return _baseMainIV;
}

- (UIView *)baseHorizonLine
{
    if (!_baseHorizonLine) {
        _baseHorizonLine = [[UIView alloc] init];
        _baseHorizonLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_baseHorizonLine];
    }
    return _baseHorizonLine;
}

@end
