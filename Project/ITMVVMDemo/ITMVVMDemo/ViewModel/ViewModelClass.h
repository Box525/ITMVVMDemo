//
//  ViewModelClass.h
//  ITMVVMDemo
//
//  Created by Box on 16/4/6.
//  Copyright © 2016年 Box. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModelClass : NSObject

@property(nonatomic,copy)ITFinishedBlock finishedBlock;

//获取网络的链接状态
-(void) netWorkStateWithNetConnectBlock:(NetWorkBlock) netConnectBlock WithURLStr:(NSString *) strURL;

// 传入交互的Block块
-(void) setBlockWithReturnBlock:(ITFinishedBlock) returnBlock;
@end
