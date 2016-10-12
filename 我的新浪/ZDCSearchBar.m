//
//  ZDCSearchBar.m
//  我的新浪
//
//  Created by allen on 16/10/7.
//  Copyright © 2016年 allen. All rights reserved.
//

#import "ZDCSearchBar.h"
#import "Header.h"
@implementation ZDCSearchBar

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索条件";
        self.background = [UIImage imageNamed:@"search_navigationbar_background"];
        
        //通过init来创建初始化绝大部分控件，控件都是没有尺寸的
        UIImageView *searchIcon = [[UIImageView alloc]init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.contentMode = UIViewContentModeCenter;
        searchIcon.width = 30;
        searchIcon.height = 30;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBar{

    return [[self alloc]init];
}

@end
