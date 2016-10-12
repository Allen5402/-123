//
//  ZDCDropdownMenu.h
//  我的新浪
//
//  Created by allen on 16/10/7.
//  Copyright © 2016年 allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZDCDropdownMenu;

@protocol ZDCDropdownMenuDelegate <NSObject>
@optional
- (void)dropdownMenuDidDismiss:(ZDCDropdownMenu *)menu;
- (void)dropdownMenuDidShow:(ZDCDropdownMenu *)menu;
@end

@interface ZDCDropdownMenu : UIView

@property (nonatomic,weak) id<ZDCDropdownMenuDelegate> delegate;

+ (instancetype)menu;

//显示
- (void)showFrom:(UIView *)from;
//销毁
- (void)dismiss;

/**
 *  内容
 */
@property (strong,nonatomic) UIView *content;
@property (strong,nonatomic) UIViewController *contentController;
@end
