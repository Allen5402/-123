//
//  ZDCDropdownMenu.m
//  我的新浪
//
//  Created by allen on 16/10/7.
//  Copyright © 2016年 allen. All rights reserved.
//

#import "ZDCDropdownMenu.h"
#import "Header.h"


@interface ZDCDropdownMenu ()

/**
 *  用来显示具体内容的容器
 */
@property (nonatomic,weak) UIImageView *contentView;

@end


@implementation ZDCDropdownMenu

- (UIImageView *)contentView{

    if (!_contentView) {
        
        UIImageView *contentView = [[UIImageView alloc]init];
        contentView.image = [UIImage imageNamed:@"popover_background"];
        contentView.width = 300;
        contentView.height = 300;
        contentView.y = 150;
        contentView.userInteractionEnabled = YES;
        
        [self addSubview:contentView];
        self.contentView = contentView;
    }
    
    return _contentView;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}

+ (instancetype)menu{

    return [[self alloc]init];
}

- (void)showFrom:(UIView *)from{
    //添加
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    
    //设置尺寸
    self.frame = window.bounds;
    
    //调整自己的位置  转换坐标系
    //默认情况下，frame是以父控件左上角为坐标原点
    //可以转化坐标系原点，改变frame的参照点
//    CGRect newFrame = [from.superview convertRect:from.frame toView:nil];//nil相当于window
    CGRect newFrame = [from convertRect:from.bounds toView:nil];//nil相当于window
    
    self.contentView.centerX = CGRectGetMidX(newFrame);
    self.contentView.y = CGRectGetMaxY(newFrame);
    
    //通知外界 自己显示了
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
        [self.delegate dropdownMenuDidShow:self];
    }
}

- (void)dismiss{

    [self removeFromSuperview];
    
    //通知外界 自己被销毁
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
        [self.delegate dropdownMenuDidDismiss:self];
    }
}

- (void)setContent:(UIView *)content{

    _content = content;
    
    content.x = 10;
    content.y = 35;
    
    //设置内容宽度
//    content.width = self.contentView.width - 2 * content.x;
    
    //设置灰色尺寸
    self.contentView.height = CGRectGetMaxY(content.frame) + 20;
    self.contentView.width = CGRectGetMaxX(content.frame) + 10;
    
    //添加内容到灰色图片中
    [self.contentView addSubview:content];
}

- (void)setContentController:(UIViewController *)contentController{
    _contentController = contentController;
    
    self.content = contentController.view;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self dismiss];
}

@end
