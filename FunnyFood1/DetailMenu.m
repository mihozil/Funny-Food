//
//  DetailMenu.m
//  FunnyFood1
//
//  Created by Apple on 1/16/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "DetailMenu.h"
#import "CustomCell.h"
#import "FoodScreen.h"

@interface DetailMenu ()


@end

@implementation DetailMenu{
    NSMutableArray* priceData;
    NSMutableArray* nameData;
    NSMutableArray* saleData;
}
- (void) viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self getData];
    [self.tableView reloadData];

}

- (void) getData{
    nameData = [[NSMutableArray alloc]init];
    priceData = [[NSMutableArray alloc]init];
    
    NSString*filepath = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",self.menunamed] ofType:@"plist"];
    NSDictionary*raw = [[NSDictionary alloc]initWithContentsOfFile:filepath];
    nameData = raw[@"foodname"];
    priceData = raw[@"price"];
    saleData = raw[@"sales"];
//        NSLog(@"%d",nameData.count);
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
//    NSLog(@"%@ ns",self.menunamed);
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return nameData.count;

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    
    CustomCell*cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString*imagename = [NSString stringWithFormat:@"%@%ld.jpg",self.menunamed,(long)indexPath.row];
    cell.imgView.image = [UIImage imageNamed:imagename];
    cell.foodname.text = nameData[indexPath.row];
    cell.priceName.text = priceData[indexPath.row];
    cell.sales.text = saleData[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodScreen*food = [[FoodScreen alloc]init];
    
    food.title = [[[self.menunamed substringToIndex:1]uppercaseString]stringByAppendingString:[self.menunamed substringFromIndex:1]];
    food.imgNamed = [NSString stringWithFormat:@"%@%ld.jpg",self.menunamed,(long)indexPath.row];
    food.foodNamed = nameData[indexPath.row];
    food.foodPrice = priceData[indexPath.row];
    food.foodSales  = saleData[indexPath.row];
    
    [self.navigationController pushViewController:food animated:YES];
    
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
