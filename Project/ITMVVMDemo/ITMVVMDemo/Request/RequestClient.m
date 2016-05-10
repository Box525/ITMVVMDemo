//
//  RequestClient.m
//  ITMVVMDemo
//
//  Created by Box on 16/4/6.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "RequestClient.h"

@implementation RequestClient

static NSString * const baseStr = @"http://www.baidu.com";

+ (instancetype)sharedRequestInstance {
    static RequestClient *__sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[RequestClient alloc]initWithBaseURL:[NSURL URLWithString:baseStr]];
    });
    
    return __sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
