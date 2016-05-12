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
#define kMainBoundsW [UIScreen mainScreen].bounds.size.width
#define kMainBoundsH [UIScreen mainScreen].bounds.size.height

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
typedef void(^CallBackMessageBlock)(id resposeObject);
//disable loggin on production
#ifdef DEBUG
#define KSLog(format, ...) CFShow((__bridge CFTypeRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);

#else
#define KSLog(...)
#endif

#define NETWORKINGURL @"http://www.baidu.com"
//风格和主题GET
#define kURLStyleAndTheme @"http://api.nanyibang.com/match-classify?age=29&system_name=iphone&versionCode=205"

/**
 *  弱引用
 */
#define BXWeakSelf __weak typeof(self) weakSelf = self;

#define BXNoteCenter [NSNotificationCenter defaultCenter]

#define BXScreenH [UIScreen mainScreen].bounds.size.height
#define BXScreenW [UIScreen mainScreen].bounds.size.width
#define BXScreenBounds [UIScreen mainScreen].bounds
#define BXKeyWindow [UIApplication sharedApplication].keyWindow

//
// 随机色
#define BXRandomColor BXColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 设置颜色
#define BXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define BXAlphaColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
//保单显示文字颜色
#define The_Prompt_Color_Nine [[UIColor alloc]initWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]
#define The_Prompt_Color_Six [[UIColor alloc]initWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
#define The_Prompt_Color_Three [[UIColor alloc]initWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]

#define The_MainColor BXColor(51, 153, 255)
#define BXGlobalBg BXColor(242, 242, 242)


#endif /* Config_h */
