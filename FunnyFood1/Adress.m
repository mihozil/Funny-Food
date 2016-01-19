//
//  Adress.m
//  FunnyFood1
//
//  Created by Apple on 1/15/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "Adress.h"
#import "detailAdress.h"

@interface Adress () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation Adress{
    NSArray*shopData;
    NSArray*locationData;
    NSArray*phoneData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self initProject];
    
}

- (void) initProject{
    shopData = @[@"Shop1",@"Shop2"];
    locationData = @[@"Nguyen Dinh Chieu",@"Le Van Luong"];
    phoneData = @[@"0912345678",@"094987245"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return shopData.count;
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.imageView.image = [UIImage imageNamed:@"location.jpg"];
    cell.textLabel.text = shopData[indexPath.row];
    cell.detailTextLabel.text = locationData[indexPath.row];
   // NSLog(@"Cell for row at index path");
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    detailAdress*detailadress = [detailAdress new];
    detailadress.adress = locationData[indexPath.row];
    detailadress.phoneNumber = phoneData[indexPath.row];
    detailadress.imgNamed = [NSString stringWithFormat:@"map%ld.png",(long)indexPath.row];
    
    [self.navigationController pushViewController:detailadress animated:YES];
    
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
