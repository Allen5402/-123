//
//  ZDCTabBarController.m
//  我的新浪
//
//  Created by allen on 16/10/7.
//  Copyright © 2016年 allen. All rights reserved.
//

#import "ZDCTabBarController.h"
#import "Header.h"
#import "ZDCTabBar.h"

@interface ZDCTabBarController ()<ZDCTabBarDelegate>

@end

@implementation ZDCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ZDCHomeViewController *home = [[ZDCHomeViewController alloc]init];
    [self addOneChildVc:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    ZDCMessageViewController *message = [[ZDCMessageViewController alloc]init];
    [self addOneChildVc:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    ZDCDiscoverViewController *discover = [[ZDCDiscoverViewController alloc]init];
    [self addOneChildVc:discover title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    ZDCProfileViewController *me = [[ZDCProfileViewController alloc]init];
    [self addOneChildVc:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
    ZDCTabBar *ZDCtabBar = [[ZDCTabBar alloc]init];
    ZDCtabBar.delegate = self;
    [self setValue:ZDCtabBar forKeyPath:@"tabBar"];
}

- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
//    childVc.view.backgroundColor = [UIColor cyanColor];
    childVc.tabBarItem.title = title;
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:255/255.0 green:130/255.0 blue:0/255.0 alpha:1]} forState:UIControlStateSelected];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    //iOS7
    if (IOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    childVc.tabBarItem.selectedImage = selectedImage;
    
    ZDCNavigationController *nav = [[ZDCNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 代理方法
- (void)tabBarDidClickPlusButton:(ZDCTabBar *)tabBar{

    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
