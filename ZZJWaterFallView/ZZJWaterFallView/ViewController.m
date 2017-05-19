//
//  ViewController.m
//  ZZJWaterFallView
//
//  Created by JOE on 2017/5/18.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import "ViewController.h"

//视图类
#import "ZZJCollectionViewLayout.h"
#import "ZZJCollectionViewCell.h"
#import "DetailViewController.h"

//工具类
#import "MJExtension.h"
#import "ShopModel.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ZZJCollectionViewLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *shops;//数据源

@end

@implementation ViewController

- (NSMutableArray *)shops {
    if (!_shops) {
        self.shops = [[NSMutableArray alloc] init];
    }
    return _shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setPage];
}

- (void)setPage {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ZZJWaterFallView";
    
    //初始化数据
    NSArray *shopsArray = [ShopModel objectArrayWithFilename:@"1.plist"];
    [self.shops addObjectsFromArray:shopsArray];
    
    ZZJCollectionViewLayout *layout = [[ZZJCollectionViewLayout alloc] init];
    layout.collectionViewLayoutDelegate = self;
    _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[ZZJCollectionViewCell class] forCellWithReuseIdentifier:ZZJCollectionCellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%ld",self.shops.count);
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZZJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZZJCollectionCellID forIndexPath:indexPath];
    //防止复用
    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    cell.shop = [self.shops objectAtIndex:indexPath.row];
    [cell sizeToFit];
    [cell configCell];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.shop = self.shops[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"点击了第%ld行",indexPath.row);
}

#pragma mark -- ZZJCollectionViewLayoutDelegate
- (CGFloat)flowLayout:(ZZJCollectionViewLayout *)flowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath {
    
    ShopModel *shop = self.shops[indexPath.row];
    return shop.h / shop.w * width;
}

@end
