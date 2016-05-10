//
//  PublicProductModelClass.h
//  ITMVVMDemo
//
//  Created by Box on 16/4/6.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "ViewModelClass.h"
#import "DataModels.h"

@interface PublicProductModelClass : ViewModelClass

//获取商品列表
- (void)fetchPublicProductList;

//跳转商品的详情页面

- (void)productDetailWithPublicModel:(HDIssues *)publicModel WithViewController:(UIViewController *)superController;


@end
