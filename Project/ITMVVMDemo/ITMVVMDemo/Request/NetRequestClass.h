//
//  NetRequestClass.h
//  ITMVVMDemo
//
//  Created by Box on 16/4/5.
//  Copyright © 2016年 Box. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequestClass : NSObject

#pragma mark 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;
+ (void) netWorkReachabilityWithURLString:(NSString *) strUrl
                               completion:(NetWorkBlock) netWorkBlock;


#pragma mark GET请求
+ (void) netRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ITFinishedBlock) block;

#pragma mark POST请求
/**
 *  <#Description#>
 *
 *  @param requestURLString <#requestURLString description#>
 *  @param parameter        <#parameter description#>
 *  @param block            <#block description#>
 */
+ (void) netRequestPOSTWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ITFinishedBlock) block;

#pragma mark ASI GET/POST请求
/**
 *  ASI 封装GET/POST请求
 *
 *  @param urlString <#urlString description#>
 *  @param params    <#params description#>
 *  @param method    <#method description#>
 *  @param block     <#block description#>
 */
+ (void)requestWithASIURL:(NSString *)urlString parmas:(NSMutableDictionary *)params httpMethod:(NSString *)method completeBlock:(ITFinishedBlock)block;

@end





