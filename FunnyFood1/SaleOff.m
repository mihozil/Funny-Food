//
//  SaleOff.m
//  FunnyFood1
//
//  Created by Apple on 1/15/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "SaleOff.h"
#import "CustomCell.h"
#import "FoodScreen.h"

@interface SaleOff ()

@end

@implementation SaleOff{
    NSMutableArray*imgNameData;
    NSMutableArray*nameData;
    NSMutableArray*priceData;
    NSMutableArray*saleData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    nameData = [NSMutableArray new];
    priceData = [NSMutableArray new];
    saleData =[NSMutableArray new];
    imgNameData = [NSMutableArray new];
    [self getData];
}
- (void) getData{
    [self getDatawith:@"birthday"];
    [self getDatawith:@"bread"];
    [self getDatawith:@"cookies"];
    [self getDatawith:@"drink"];
    [self getDatawith:@"cream"];
    
}
- (void) getDatawith:(NSString*)category{
    NSString*filepath = [[NSBundle mainBundle]pathForResource:category ofType:@"plist"];
    NSDictionary*raw = [[NSDictionary alloc]initWithContentsOfFile:filepath];
    NSArray*nameArray = raw[@"foodname"];
    NSArray*priceArray = raw[@"price"];
    NSArray*saleArray = raw[@"sales"];
    
    for (int i = 0; i<nameArray.count; i++){
        NSString*item = saleArray[i];
        if (![item isEqualToString:@"0%"]){
            [nameData addObject:nameArray[i]];
            [priceData addObject:priceArray[i]];
            [saleData addObject:saleArray[i]];
            
            NSString*imagename = [NSString stringWithFormat:@"%@%ld.jpg",category,(long)i];

            [imgNameData addObject:imagename];
        }
    }
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return nameData.count;
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell*cell = (CustomCell*) [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imgView.image = [UIImage imageNamed:imgNameData[indexPath.row]];
    cell.foodname.text = nameData[indexPath.row];
    cell.priceName.text = priceData[indexPath.row];
    cell.sales.text = saleData[indexPath.row];
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodScreen*foodScreen = [FoodScreen new];
    
    foodScreen.title = [NSString stringWithFormat:@"Sale Off: %@",nameData[indexPath.row]];
    foodScreen.imgNamed = imgNameData[indexPath.row];
    foodScreen.foodNamed = nameData[indexPath.row];
    foodScreen.foodPrice = priceData[indexPath.row];
    foodScreen.foodSales = saleData[indexPath.row];
    
    [self.navigationController pushViewController:foodScreen animated:YES];
    
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
