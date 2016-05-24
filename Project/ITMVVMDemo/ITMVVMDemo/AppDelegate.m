//
//  AppDelegate.m
//  ITMVVMDemo
//
//  Created by Box on 16/4/1.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ITIntroductionVC.h"
#import "ITTabBarVC.h"

typedef void(^block)(void);

@interface AppDelegate (){

}

@property(nonatomic,copy)block bbb;
@property(nonatomic,assign)NSInteger number;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    AppDelegate *a = [AppDelegate new];
//    AppDelegate *b = [AppDelegate new];
//    
//    a.number = 10;
//    b.number = 100;
//    
//    __block NSInteger c = 1,d = 2;
//    
//    a.bbb = ^(){
//        NSLog(@"b+d = %ld",b.number+d);
//    };
//    b.bbb = ^(){
//        c++;
//        NSLog(@"a+c = %ld",a.number+c);
//    };
//    
//    c++;
//    d++;
//    
//    a.bbb();
//    b.bbb();

    
    
    self.window = [[UIWindow alloc]initWithFrame:kMainBounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ITTabBarVC *rootVC = [[ITTabBarVC alloc]init];
    
    
    //引导界面
    ITIntroductionVC *introductionVC = [ITIntroductionVC new];
    
    [self.window addSubview:introductionVC.view];
    
    __block ITIntroductionVC *weakSelf = introductionVC;
    [introductionVC enterRootVC:^{
        [weakSelf.view removeFromSuperview];
        self.window.rootViewController = rootVC;
    }];
    
    self.window.rootViewController = weakSelf;
    
    
    
//    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[MainViewController new]];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
