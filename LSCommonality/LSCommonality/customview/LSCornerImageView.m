//
//  LSCornerImageView.m
//  LSCommonality
//
//  Created by 海尔智能-李松 on 2018/12/7.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSCornerImageView.h"
#import <Masonry/Masonry.h>

@interface LSCornerImageView ()

@property (nonatomic, strong) UIImageView *leftTopIV;
@property (nonatomic, strong) UIImageView *rightTopIV;
@property (nonatomic, strong) UIImageView *leftBottomIV;
@property (nonatomic, strong) UIImageView *rightBottomIV;

@end

@implementation LSCornerImageView


- (instancetype)init
{
    self = [super init];
    if (self) {
        _corner = LSCornerImageViewCornerAll;
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    [super setImage:image];
    
    [self bringSubviewToFront:self.leftTopIV];
    [self bringSubviewToFront:self.rightTopIV];
    [self bringSubviewToFront:self.leftBottomIV];
    [self bringSubviewToFront:self.rightBottomIV];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _corner = LSCornerImageViewCornerAll;
    }
    return self;
}

- (void)setCornerColor:(UIColor *)cornerColor
{
    _cornerColor = cornerColor;
    self.leftTopIV.image = [self imageWithImage:self.leftTopIV.image color:cornerColor];
    self.rightTopIV.image = [self imageWithImage:self.rightTopIV.image color:cornerColor];
    self.leftBottomIV.image = [self imageWithImage:self.leftBottomIV.image color:cornerColor];
    self.rightBottomIV.image = [self imageWithImage:self.rightBottomIV.image color:cornerColor];
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    [self configImageViewUI];
}

- (void)setCorner:(LSCornerImageViewCorner)corner
{
    _corner = corner;
    [self configImageViewUI];
}

- (void)configImageViewUI
{
    [self.leftTopIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.height.mas_equalTo(self.cornerRadius);
    }];
    
    [self.rightTopIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(0);
        make.width.height.mas_equalTo(self.cornerRadius);
    }];
    
    [self.leftBottomIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.width.height.mas_equalTo(self.cornerRadius);
    }];
    
    [self.rightBottomIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.width.height.mas_equalTo(self.cornerRadius);
    }];
    
    self.leftTopIV.hidden = !(self.corner & LSCornerImageViewCornerLeftTop);
    self.rightTopIV.hidden = !(self.corner & LSCornerImageViewCornerRightTop);
    self.leftBottomIV.hidden = !(self.corner & LSCornerImageViewCornerLeftBottom);
    self.rightBottomIV.hidden = !(self.corner & LSCornerImageViewCornerRightBottom);
}

- (UIImageView *)leftTopIV
{
    if (!_leftTopIV) {
        _leftTopIV = [[UIImageView alloc] init];
        _leftTopIV.image = [UIImage imageNamed:@"Corner_LeftTop_White"];
        [self addSubview:_leftTopIV];
    }
    return _leftTopIV;
}

- (UIImageView *)rightTopIV
{
    if (!_rightTopIV) {
        _rightTopIV = [[UIImageView alloc] init];
        _rightTopIV.image = [UIImage imageNamed:@"Corner_RightTRop_White"];
        [self addSubview:_rightTopIV];
    }
    return _rightTopIV;
}

- (UIImageView *)leftBottomIV
{
    if (!_leftBottomIV) {
        _leftBottomIV = [[UIImageView alloc] init];
        _leftBottomIV.image = [UIImage imageNamed:@"Corner_LeftBottom_White"];
        [self addSubview:_leftBottomIV];
    }
    return _leftBottomIV;
}



- (UIImageView *)rightBottomIV
{
    if (!_rightBottomIV) {
        _rightBottomIV = [[UIImageView alloc] init];
        _rightBottomIV.image = [UIImage imageNamed:@"Corner_RightBottom_White"];
        [self addSubview:_rightBottomIV];
    }
    return _rightBottomIV;
}

- (UIImage *)imageWithImage:(UIImage *)image color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0, image.size.height);
    
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextClipToMask(context, rect, image.CGImage);
    
    [color setFill];
    
    CGContextFillRect(context, rect);
    
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}




@end
