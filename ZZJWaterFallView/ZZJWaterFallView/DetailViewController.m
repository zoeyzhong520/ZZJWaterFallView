//
//  DetailViewController.m
//  ZZJWaterFallView
//
//  Created by JOE on 2017/5/19.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+WebCache.h"

@interface DetailViewController ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setPage];
}

- (void)setPage {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"详情";
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height-80)];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_shop.img]];
    [self.view addSubview:_imageView];
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
