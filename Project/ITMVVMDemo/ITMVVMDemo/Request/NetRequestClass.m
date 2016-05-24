//
//  NetRequestClass.m
//  ITMVVMDemo
//
//  Created by Box on 16/4/5.
//  Copyright © 2016年 Box. All rights reserved.
///Users/box/Desktop/ITMVVMDemo/ITMVVMDemo/Request/NetRequestClass.m:98:23: Capturing 'request' strongly in this block is likely to lead to a retain cycle

#import "NetRequestClass.h"
#import "RequestClient.h"


@implementation NetRequestClass

#pragma mark GET请求
+ (void) netRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ITFinishedBlock) block {
//    [[RequestClient sharedRequestInstance] GET:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        block(responseObject,nil);
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        block(nil,error);
//        
//        
//        
//    }];
    
    [[RequestClient sharedRequestInstance] GET:requestURLString parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        block(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];
    
}

#pragma mark POST请求
+ (void) netRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (ITFinishedBlock) block {
    
    RequestClient *client = [RequestClient sharedRequestInstance];
//    client.requestSerializer = [AFJSONRequestSerializer serializer];
    client.responseSerializer = [AFHTTPResponseSerializer serializer];
    client.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
//    [[RequestClient sharedRequestInstance] POST:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        KSLog(@"%@",task.error.localizedDescription);
//        
////        NSData *data = [responseObject JSONData];
////        NSDictionary *dict = [data objectFromJSONData];
////        KSLog(@"%@",dict);
//        block(responseObject,nil);
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        
//        block(nil,error);
//        
//        
//    }];
    
    [[RequestClient sharedRequestInstance] POST:requestURLString parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        block(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];
    
}



+ (void)requestWithASIURL:(NSString *)urlString parmas:(NSMutableDictionary *)params httpMethod:(NSString *)method completeBlock:(ITFinishedBlock)block{
    //处理GET请求
    if ([[method uppercaseString] isEqualToString:@"GET"]) {
        NSArray *keys=[params allKeys];
        for (int i=0; i<keys.count; i++) {
            NSString *key=[keys objectAtIndex:i];
            NSString *values=[params valueForKey:key];
            urlString= [urlString stringByAppendingFormat:@"&%@=%@",key,values];
        }
        
    }
    NSURL *url=[NSURL URLWithString:urlString];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:method];
    [request setTimeOutSeconds:10];
    //处理POST请求
    if ([[method uppercaseString] isEqualToString:@"POST"]) {
        NSArray *keys=[params allKeys];
        for (int i=0; i<keys.count; i++) {
            NSString *key=[keys objectAtIndex:i];
            NSString *value=[params objectForKey:key];
            if ([value isKindOfClass:[UIImage class]]) {
                //  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test4" ofType:@"gif"];
                //  NSData*  data=[NSData dataWithContentsOfFile:filePath];
                NSData *imageData=UIImageJPEGRepresentation((UIImage *)value, 1.0);
                [request addData:imageData forKey:key];
            }
            [request setPostValue:value forKey:key];
            
        }
    }
    
    __block ASIFormDataRequest *weakself = request;
    
    [request setCompletionBlock:^{
        NSData *data=[weakself responseData];
        //系统自带的JSON解析方法
//        NSJSONSerialization *json=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //JSONKit 的解析方法
        NSDictionary *json = [data objectFromJSONData];
        block(json,nil);
    }];
    
    [request setFailedBlock:^{
        block(nil,weakself.error);
    }];
    [request startAsynchronous];
    
}


#pragma mark 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *)strUrl {
    
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
#if 0
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                netState = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                break;
        }
    }];
    
    [manager startMonitoring];
    
    
    
    
#else

//    RequestClient *manager = [RequestClient sharedRequestInstance];//[[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
#endif
    
    return netState;
    
}

#pragma mark 监测网络的可链接性2

+ (void) netWorkReachabilityWithURLString:(NSString *) strUrl completion:(NetWorkBlock)netWorkBlock {
    __block BOOL netState = NO;
    //TODO: 1234567890
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
//    RequestClient *manager = [RequestClient sharedRequestInstance];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                //???: 不知道
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
        netWorkBlock(netState);
    }];
    
    [manager.reachabilityManager startMonitoring];
}



@end









