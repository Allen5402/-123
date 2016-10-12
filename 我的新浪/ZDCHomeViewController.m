//
//  ZDCHomeViewController.m
//  我的新浪
//
//  Created by allen on 16/10/7.
//  Copyright © 2016年 allen. All rights reserved.
//

#import "ZDCHomeViewController.h"
#import "Header.h"
#import "ZDCTitleViewController.h"
@interface ZDCHomeViewController ()<ZDCDropdownMenuDelegate,UIWebViewDelegate>

@end

@implementation ZDCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //头部
    UIButton *titleButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    titleButton.width = 100;
    titleButton.height = 30;
    
    [titleButton setTitle:@"首页" forState:(UIControlStateNormal)];
    [titleButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:(UIControlStateNormal)];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:(UIControlStateSelected)];
    titleButton.selected = NO;
    titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
    titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    
    //监听标题点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.navigationItem.titleView = titleButton;
    
    
    //回调
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    webView.delegate = self;
    [self.view addSubview:webView];
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=473127489&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

#pragma mark webView代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView{

}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    
    
    
    return YES;
}

/*标题点击*/
- (void)titleClick:(UIButton *)titleButton{
    
    ZDCDropdownMenu *menu = [[ZDCDropdownMenu alloc]init];
    //设置代理
    menu.delegate = self;
    
    ZDCTitleViewController *vc = [[ZDCTitleViewController alloc]init];
    vc.view.height = 100;
    vc.view.width = 200;
    
    menu.contentController = vc;
    
    [menu showFrom:titleButton];
    
}


/*代理方法*/
- (void)dropdownMenuDidDismiss:(ZDCDropdownMenu *)menu{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = NO;
//    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:(UIControlStateNormal)];
}

- (void)dropdownMenuDidShow:(ZDCDropdownMenu *)menu{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = YES;
//    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:(UIControlStateNormal)];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
