//
//  ZDCTabBar.m
//  我的新浪
//
//  Created by allen on 16/10/7.
//  Copyright © 2016年 allen. All rights reserved.
//

#import "ZDCTabBar.h"
#import "Header.h"

@interface ZDCTabBar ()
@property (nonatomic,weak) UIButton *plusBtn;
@end

@implementation ZDCTabBar

@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        UIButton *plusBtn = [[UIButton alloc]init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:(UIControlStateNormal)];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:(UIControlStateHighlighted)];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:(UIControlStateNormal)];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:(UIControlStateHighlighted)];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}

/**
 *  加号按钮点击
 */
- (void)plusClick{

    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}


- (void)layoutSubviews{

    [super layoutSubviews];
    
    //加好按钮位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    
    //其他按钮位置
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            //设置宽度
            child.width = tabbarButtonW;
            //x
            child.x = tabbarButtonIndex *tabbarButtonW;
            
            //增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}

@end
