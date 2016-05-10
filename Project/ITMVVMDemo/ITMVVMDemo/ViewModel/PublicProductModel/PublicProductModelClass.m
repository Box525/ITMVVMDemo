//
//  PublicProductModelClass.m
//  ITMVVMDemo
//
//  Created by Box on 16/4/6.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "PublicProductModelClass.h"
#import "NetRequestClass.h"
#import "DataModels.h"
#import "PIViewController.h"

@implementation PublicProductModelClass

//获取商品列表
- (void)fetchPublicProductList {
    
    NSString *url = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=eeec77fc9690c7c0b1e70f6a3fb021d2&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
    
#if 0
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass netRequestGETWithRequestURL:url WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
                if (!error) {
//                    NSDictionary *dict = (NSDictionary *)responseObject;//[responseObject objectFromJSONData];
//                    HDHDBasicClass *data = [HDHDBasicClass modelObjectWithDictionary:dict];
//                    //                    KSLog(@"%@",data.content.issues);
//                    for (HDIssues *issues in data.content.issues) {
//                        
//                        KSLog(@"%@",issues);
//                        
//                    }
                    
                    if (responseObject) {
                        [self fetchValueSuccessWithDic:(NSDictionary *)responseObject];
                    }
                }
            }];
        }else{
            KSLog(@"NO Networking!!!");
        }
    }];
    
#else
    
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass requestWithASIURL:url parmas:nil httpMethod:@"GET" completeBlock:^(id responseObject, NSError *error) {
                if (!error) {
                    [self fetchValueSuccessWithDic:(NSDictionary *)responseObject];
                } else {
                    
                }
            }];
        }else{
            
        }
    }];
    
    
#endif
    
}

#pragma mark 获取到正确的数据，对正确的数据进行处理
-(void)fetchValueSuccessWithDic:(NSDictionary *)returnValue {
    //对从后台获取的数据进行处理，然后传给ViewController层进行显示
    
    HDHDBasicClass *data = [HDHDBasicClass modelObjectWithDictionary:returnValue];
    
    self.finishedBlock(data,nil);
    
}

//跳转商品的详情页面

- (void)productDetailWithPublicModel:(HDIssues *)publicModel WithViewController:(UIViewController *)superController {
    
    PIViewController *piVC = [PIViewController new];
    piVC.publicModel = publicModel;
    [superController.navigationController pushViewController:piVC animated:YES];
    
}


@end








