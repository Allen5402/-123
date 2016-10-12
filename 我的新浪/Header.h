//
//  Header.h
//  我的新浪
//
//  Created by allen on 16/10/7.
//  Copyright © 2016年 allen. All rights reserved.
//

#ifndef Header_h
#define Header_h

#ifdef DEBUG
#define ZDCLog(...) NSLog(__VA_ARGS__)
#else
#define ZDCLog(...)

#endif

#define IOS7 ([[UIDevice currentDevice].systemVersion doubleValue]) >= 7.0

#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "ZDCSearchBar.h"
#import "ZDCDropdownMenu.h"
#import "ZDCNavigationController.h"

#import "ZDCHomeViewController.h"
#import "ZDCMessageViewController.h"
#import "ZDCDiscoverViewController.h"
#import "ZDCProfileViewController.h"



#endif /* Header_h */
