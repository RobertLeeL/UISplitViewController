//
//  MeauTableViewController.h
//  UISplitViewController
//
//  Created by 李龙跃 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeauTableViewController,FoodType;

@protocol MeauTableViewControllerDelegate <NSObject>
@optional
- (void)meauTableViewController:(MeauTableViewController *)meanTVC foodType:(FoodType *)foodType;

@end

@interface MeauTableViewController : UITableViewController

@property (nonatomic,weak)id<MeauTableViewControllerDelegate>delegate;



@end
