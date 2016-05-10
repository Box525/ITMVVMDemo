//
//  Config.h
//  ITMVVMDemo
//
//  Created by Box on 16/4/1.
//  Copyright © 2016年 Box. All rights reserved.
//

#ifndef Config_h
#define Config_h

#import <Foundation/Foundation.h>

#define kMainBounds [UIScreen mainScreen].bounds

#define SDColor(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]

#define Global_mainBackgroundColor SDColor(248, 248, 248, 1)

#define TimeLineCellHighlightedColor [UIColor colorWithRed:92/255.0 green:140/255.0 blue:193/255.0 alpha:1.0]

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);

typedef void(^Succeed)(id responseObject);
typedef void(^Failed)(NSError *error);

typedef void(^ITFinishedBlock)(id responseObject, NSError *error);
//disable loggin on production
#ifdef DEBUG
#define KSLog(format, ...) CFShow((__bridge CFTypeRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);

#else
#define KSLog(...)
#endif

#define NETWORKINGURL @"http://www.baidu.com"


#endif /* Config_h */
