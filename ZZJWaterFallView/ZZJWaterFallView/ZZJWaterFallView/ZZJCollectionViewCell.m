//
//  ZZJCollectionViewCell.m
//  ZZJWaterFallView
//
//  Created by 仲召俊 on 2017/5/18.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import "ZZJCollectionViewCell.h"
#import "UIImageView+WebCache.h"

NSString *const ZZJCollectionCellID = @"ZZJCollectionCellID";

@interface ZZJCollectionViewCell ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *label;

@end

@implementation ZZJCollectionViewCell

- (void)configCell {
    //self.backgroundColor = [UIColor purpleColor];
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_shop.img]];
    [self addSubview:_imageView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-40, self.bounds.size.width, 40)];
    _label.text = [NSString stringWithFormat:@"%@",_shop.price];
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_label];
}

- (void)setShop:(ShopModel *)shop {
    _shop = shop;
}

@end
