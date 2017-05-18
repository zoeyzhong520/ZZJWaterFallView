//
//  ZZJCollectionViewCell.h
//  ZZJWaterFallView
//
//  Created by 仲召俊 on 2017/5/18.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

FOUNDATION_EXPORT NSString *const ZZJCollectionCellID;

@interface ZZJCollectionViewCell : UICollectionViewCell

@property (nonatomic,retain) ShopModel *shop;

- (void)configCell;

@end
