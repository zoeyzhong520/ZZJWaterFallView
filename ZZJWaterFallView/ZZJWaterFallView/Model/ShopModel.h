//
//  ShopModel.h
//  ZZJWaterFallView
//
//  Created by 仲召俊 on 2017/5/18.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShopModel : NSObject

@property (nonatomic,assign) CGFloat h;
@property (nonatomic,assign) CGFloat w;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *price;

@end
