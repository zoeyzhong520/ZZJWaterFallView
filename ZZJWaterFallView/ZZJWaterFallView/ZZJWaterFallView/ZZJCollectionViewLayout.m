//
//  ZZJCollectionViewLayout.m
//  ZZJWaterFallView
//
//  Created by 仲召俊 on 2017/5/18.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import "ZZJCollectionViewLayout.h"

@interface ZZJCollectionViewLayout ()

@property (nonatomic,strong) NSMutableDictionary *maxYDict;//这个字典用来存储每一列最大的Y值(每一列的高度)
@property (nonatomic,strong) NSMutableArray *attributeArray;//存放所有的布局属性

@end

@implementation ZZJCollectionViewLayout

- (NSMutableDictionary *)maxYDict {
    if (!_maxYDict) {
        self.maxYDict = [[NSMutableDictionary alloc] init];
    }
    return _maxYDict;
}

- (NSMutableArray *)attributeArray {
    if (!_attributeArray) {
        self.attributeArray = [[NSMutableArray alloc] init];
    }
    return _attributeArray;
}

- (instancetype)init {
    if (self = [super init]) {
        self.colMargin = 15;//列间距
        self.rowMargin = 10;//行间距
        self.columnsCount = 3;//列数
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

// 布局每一个indexPath的位置
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //计算尺寸
    CGFloat width = (self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - (self.columnsCount - 1) * self.colMargin) / self.columnsCount;
    // 代理计算传入高的值
    CGFloat height = [self.collectionViewLayoutDelegate flowLayout:self heightForWidth:width atIndexPath:indexPath];
    
    //假设最短的那一列的第0列
    __block NSString *minColumn = @"0";
    // 遍历字典找出最短的那一列
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] < [self.maxYDict[minColumn] floatValue]) {
            minColumn = column;
        }
    }];
    
    //计算位置
    CGFloat x = self.sectionInset.left + (self.colMargin + width) * [minColumn intValue];
    CGFloat y = [self.maxYDict[minColumn] floatValue] + _rowMargin;
    
    self.maxYDict[minColumn] = @(y + height);
    
    //创建属性
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = CGRectMake(x, y, width, height);
    return attributes;
}

- (void)prepareLayout {
    [super prepareLayout];
    //清空最大的Y值
    for (int i=0;i<self.columnsCount;i++) {
        NSString *column = [NSString stringWithFormat:@"%d",i];
        self.maxYDict[column] = @(self.sectionInset.top);
    }
    [self.attributeArray removeAllObjects];
    
    //总item数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i=0;i<count;i++) {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [self.attributeArray addObject:attributes];
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributeArray;
}

// 计算ContentSize
- (CGSize)collectionViewContentSize {
    // 默认最大Y值在第0列
    __block NSString *maxColumn = @"0";
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] > [self.maxYDict[maxColumn] floatValue]) {
            maxColumn = column;
        }
    }];
    return CGSizeMake(0, [self.maxYDict[maxColumn] floatValue] + self.sectionInset.bottom);
}

@end
