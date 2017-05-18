//
//  ZZJCollectionViewLayout.h
//  ZZJWaterFallView
//
//  Created by 仲召俊 on 2017/5/18.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZZJCollectionViewLayout;

@protocol ZZJCollectionViewLayoutDelegate <NSObject>

- (CGFloat)flowLayout:(ZZJCollectionViewLayout *)flowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZZJCollectionViewLayout : UICollectionViewLayout

@property (nonatomic,weak) id <ZZJCollectionViewLayoutDelegate> collectionViewLayoutDelegate;

@property (nonatomic,assign) UIEdgeInsets sectionInset;//外边距
@property (nonatomic,assign) CGFloat rowMargin;//行间距
@property (nonatomic,assign) CGFloat colMargin;//列间距
@property (nonatomic,assign) int columnsCount;//列数

@end
