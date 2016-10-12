//
//  ZDCTabBar.h
//  我的新浪
//
//  Created by allen on 16/10/7.
//  Copyright © 2016年 allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZDCTabBar;

@protocol ZDCTabBarDelegate <UITabBarDelegate>

@optional
- (void)tabBarDidClickPlusButton:(ZDCTabBar *)tabBar;

@end

@interface ZDCTabBar : UITabBar

@property (nonatomic,weak) id<ZDCTabBarDelegate> delegate;

@end
