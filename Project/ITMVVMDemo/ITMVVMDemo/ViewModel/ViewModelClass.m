//
//  ViewModelClass.m
//  ITMVVMDemo
//
//  Created by Box on 16/4/6.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "ViewModelClass.h"
#import "NetRequestClass.h"

@implementation ViewModelClass

- (void)dealloc {
    self.finishedBlock = nil;
}

#pragma mark 获取网络的链接状态
- (void)netWorkStateWithNetConnectBlock:(NetWorkBlock) netConnectBlock WithURLStr:(NSString *) strURL {
    [NetRequestClass netWorkReachabilityWithURLString:strURL completion:^(BOOL netConnetState) {
        netConnectBlock(netConnetState);
    }];
}

#pragma mark 传入交互的Block块
-(void) setBlockWithReturnBlock:(ITFinishedBlock) returnBlock {
    self.finishedBlock = returnBlock;
}

@end
