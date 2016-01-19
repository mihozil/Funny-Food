//
//  MainScreen.m
//  FunnyFood1
//
//  Created by Apple on 1/15/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "MainScreen.h"
#import "DetailMenu.h"

@interface MainScreen ()

@end

@implementation MainScreen{
    DetailMenu*detailmenu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:nil];
    [self initDetailmenu];
    
}
- (void) initDetailmenu{
    detailmenu = [[DetailMenu alloc]init];
}
- (IBAction)birthdayButton:(id)sender {
   // detailmenu.stringTitleDetailScreen = @"Birthday";
    detailmenu.menunamed = @"birthday";
    
    NSString*title = [[[detailmenu.menunamed substringToIndex:1]uppercaseString]stringByAppendingString:[detailmenu.menunamed substringFromIndex:1]];
        detailmenu.title = title;
    
    [self.navigationController pushViewController:detailmenu animated:YES];
    
}
- (IBAction)breadButton:(id)sender {
    
    detailmenu.menunamed = @"bread";
    
    NSString*title = [[[detailmenu.menunamed substringToIndex:1]uppercaseString]stringByAppendingString:[detailmenu.menunamed substringFromIndex:1]];
    detailmenu.title = title;
    
    [self.navigationController pushViewController:detailmenu animated:YES];
    
}
- (IBAction)cookiesButton:(id)sender {
    detailmenu.menunamed = @"cookies";
    
    NSString*title = [[[detailmenu.menunamed substringToIndex:1]uppercaseString]stringByAppendingString:[detailmenu.menunamed substringFromIndex:1]];
    detailmenu.title = title;
    
    [self.navigationController pushViewController:detailmenu animated:true];
}
- (IBAction)drinkButton:(id)sender {
    detailmenu.menunamed = @"drink";
    
    NSString*title = [[[detailmenu.menunamed substringToIndex:1]uppercaseString]stringByAppendingString:[detailmenu.menunamed substringFromIndex:1]];
    detailmenu.title = title;
    [self.navigationController pushViewController:detailmenu animated:true];
}
- (IBAction)creamButton:(id)sender {
    detailmenu.menunamed = @"cream";
    
    NSString*title = [[[detailmenu.menunamed substringToIndex:1]uppercaseString]stringByAppendingString:[detailmenu.menunamed substringFromIndex:1]];
    detailmenu.title = title;
    [self.navigationController pushViewController:detailmenu animated:true];
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
