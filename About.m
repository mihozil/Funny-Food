//
//  About.m
//  FunnyFood1
//
//  Created by Apple on 1/15/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "About.h"

@interface About ()

@end

@implementation About{
    UITextView* textView;
    float width,height,margin;
    NSTimer*timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    width = self.view.bounds.size.width;
    height = self.view.bounds.size.height;
    margin = 30;
    
    UIImageView* background = [[UIImageView alloc]initWithFrame:self.view.bounds];
    background.image = [UIImage imageNamed:@"backGroundBlack.jpg"];
    [self.view addSubview: background];
    
    textView = [UITextView new];
    textView.frame = CGRectMake( margin,margin, width-margin*2, height);
    textView.textColor = [UIColor whiteColor];
    textView.backgroundColor = [UIColor clearColor];
    [textView setFont:[UIFont fontWithName:@"Arial" size:25]];
    
    textView.text = [NSString stringWithFormat:@"Nguyen Hoang Tuan Minh\nTechmaster liên tục nhận được rất nhiều yêu cầu tuyển dụng lập trình viên web và di động đáp ứng nhiều kỹ năng đa dạng, có kinh nghiệm lập trình sản phẩm tối thiểu 6 tháng \n \n The Software Quality Engineer at Confluence is responsible for participating in QA engineering teams and contributing ideas to an evolving testing strategy. This person will be involved with the entire product lifecycle – requirements, design, review and coding, stabilization, beta, release, and service packs. The person in this position will work directly with Project Management, Development, Design, Product Management, and Support. A comprehensive understanding and background in software development and testing methodologies are required. This position will report to the Vice President of Product Development."];
    
    [self textViewRunning];
    
    [self.view addSubview:textView];
    
    

}
- (void) textViewRunning{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(scrollTextView) userInfo:nil repeats:true];
    
    
}
- (void) scrollTextView{

    CGPoint contentOffset = textView.contentOffset;
    contentOffset.y+=1;
    if (contentOffset.y>600) {
        contentOffset.y=-300;
    }
    textView.contentOffset = contentOffset;
    
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
