//
//  RecipeViewController.m
//  UISplitViewController
//
//  Created by 李龙跃 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RecipeViewController.h"

@interface RecipeViewController ()

@property (nonatomic,weak)UIWebView *webView;

@end

@implementation RecipeViewController



- (void)loadView {
    UIWebView *webView = [[UIWebView alloc]init];
    
    webView.frame = [UIScreen mainScreen].applicationFrame;
    self.view = webView;
    
    self.webView = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    
    //拼接html
    NSString *htmlName = [NSString stringWithFormat:@"Html/food/%@.html", self.food.idstr];
    //加载本地文件
    NSURL *htmlURL = [[NSBundle mainBundle] URLForResource:htmlName withExtension:nil];
    
    // 3.根据URL创建NSURLRequest对象
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    // 4.加载对应的request
    [self.webView loadRequest:request];

    // Do any additional setup after loading the view.
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
