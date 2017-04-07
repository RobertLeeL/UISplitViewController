//
//  DetailTableViewController.m
//  UISplitViewController
//
//  Created by 李龙跃 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DetailTableViewController.h"
#import "FoodType.h"
#import "Food.h"
#import "MJExtension.h"
#import "DetailCellTableViewCell.h"
#import "RecipeViewController.h"

@interface DetailTableViewController ()

@property (nonatomic,strong)NSArray *foods;

@end

@implementation DetailTableViewController


#pragma mark - meauTableViewControllerDelegate

- (void)meauTableViewController:(MeauTableViewController *)meanTVC foodType:(FoodType *)foodType {
    self.title = foodType.name;
    
    NSString *fileName = [NSString stringWithFormat:@"type_%@_foods.plist",foodType.idstr];
    
    self.foods = [Food objectArrayWithFilename:fileName];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 122;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foods.count;
}



- (DetailCellTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailCellTableViewCell *cell = [DetailCellTableViewCell detailCell:tableView];
    
    Food *food = self.foods[indexPath.row];
    
    cell.food = food;
    
   
    
    return cell;
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Food *food   = self.foods[indexPath.row];
    RecipeViewController *recipeVc = [[RecipeViewController alloc]init];
    recipeVc.food = food;
    
    UINavigationController *recipeNav = [[UINavigationController alloc]initWithRootViewController:recipeVc];
    
    recipeNav.modalPresentationStyle = UIModalPresentationFormSheet;
    
    recipeNav.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:recipeNav animated:YES completion:nil];
    
}


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
