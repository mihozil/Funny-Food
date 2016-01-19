//
//  FoodScreen.m
//  FunnyFood1
//
//  Created by Apple on 1/18/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "FoodScreen.h"
#import "DetailMenu.h"

@interface FoodScreen ()
@property (weak, nonatomic) IBOutlet UIImageView *imgLarge;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleLabel;

@end

@implementation FoodScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.imgLarge.image = [UIImage imageNamed:self.imgNamed];
    self.nameLabel.text = self.foodNamed;
    self.priceLabel.text = [NSString stringWithFormat:@"Price : %@",self.foodPrice];
    self.saleLabel.text = [NSString stringWithFormat:@"Sales off: %@",self.foodSales];
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
