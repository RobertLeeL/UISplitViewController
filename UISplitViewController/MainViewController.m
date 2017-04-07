//
//  MainViewController.m
//  UISplitViewController
//
//  Created by 李龙跃 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MainViewController.h"
#import "MeauTableViewController.h"
#import "DetailTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *meauNav = [self.childViewControllers firstObject];
    MeauTableViewController *meauTvc = [meauNav.childViewControllers firstObject];
    
    
    UINavigationController *detailNav = [self.childViewControllers lastObject];
    DetailTableViewController *detailTvc = [detailNav.childViewControllers firstObject];
    
    meauTvc.delegate = detailTvc;
    self.delegate = detailTvc;
    
    
    // Do any additional setup after loading the view.
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
