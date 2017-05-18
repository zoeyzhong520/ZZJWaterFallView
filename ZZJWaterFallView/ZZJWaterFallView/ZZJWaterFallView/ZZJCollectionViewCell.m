//
//  ZZJCollectionViewCell.m
//  ZZJWaterFallView
//
//  Created by 仲召俊 on 2017/5/18.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import "ZZJCollectionViewCell.h"

NSString *const ZZJCollectionCellID = @"ZZJCollectionCellID";

@implementation ZZJCollectionViewCell

- (void)configCell {
    self.backgroundColor = [UIColor purpleColor];
}

- (void)setShop:(ShopModel *)shop {
    _shop = shop;
}

@end
