//
//  DetailCellTableViewCell.h
//  UISplitViewController
//
//  Created by 李龙跃 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"

@interface DetailCellTableViewCell : UITableViewCell

@property (nonatomic,strong)Food *food;



+ (instancetype)detailCell:(UITableView *)tableView;
@end
