//
//  HFNavigationBar.h
//  LSCommonality
//
//  Created by 李松 on 2018/12/28.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "HFBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HFNavigationBar : HFBaseView


@property(nonatomic,strong)UIButton *backButton;

@property(nonatomic,strong)UIButton *secondButton;

@property(nonatomic,strong)UIButton *thirdButton;

@property(nonatomic,strong)UIButton *rightButton;


/**
 展示导航背景图片

 @param imageObj 图片对象，可以是Image，也可以是URL string
 */
- (void)showBgImageViewWithImageObj:(id)imageObj;


@end

NS_ASSUME_NONNULL_END
