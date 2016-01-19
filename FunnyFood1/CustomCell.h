//
//  CustomCell.h
//  FunnyFood1
//
//  Created by Apple on 1/16/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *foodname;
@property (weak, nonatomic) IBOutlet UILabel *priceName;
@property (weak, nonatomic) IBOutlet UILabel *sales;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
