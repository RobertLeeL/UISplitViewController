//
//  DetailCellTableViewCell.m
//  UISplitViewController
//
//  Created by 李龙跃 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DetailCellTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface DetailCellTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation DetailCellTableViewCell

+ (instancetype)detailCell:(UITableView *)tableView {
    static NSString *ID = @"DetailCell";
    DetailCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DetailCellTableViewCell" owner:nil options:nil] lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
    
}

- (void)setFood:(Food *)food {
    _food = food;
    NSURL *imageUrl = [NSURL URLWithString:food.imageUrl];
    [self.iconView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]options:SDWebImageRetryFailed | SDWebImageLowPriority];
    
    self.nameLabel.text = food.name;
    self.detailLabel.text = [NSString stringWithFormat:@"难度： %@   时间：  %@",food.diff,food.time];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
