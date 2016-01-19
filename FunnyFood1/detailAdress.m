//
//  detailAdress.m
//  FunnyFood1
//
//  Created by Apple on 1/18/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "detailAdress.h"

@interface detailAdress ()<UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (nonatomic, strong) UIImageView* imgView;
@property (nonatomic, assign) BOOL check;

@end

@implementation detailAdress{
    float width,height;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.addressLabel.text = self.adress;
    self.phoneLabel.text = self.phoneNumber;
    
}
- (void)viewDidLayoutSubviews{
    if (!self.check){
        width = self.scrollView.frame.size.width;
        height = self.scrollView.frame.size.height;
        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        self.imgView.image = [UIImage imageNamed:self.imgNamed];
        [self.scrollView addSubview:self.imgView];
        
        
        self.scrollView.delegate = self;
        self.scrollView.maximumZoomScale = 5;
        self.scrollView.minimumZoomScale = 1;
        self.scrollView.zoomScale = 1;
        
        self.check = true;
        
    }
    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imgView;
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
