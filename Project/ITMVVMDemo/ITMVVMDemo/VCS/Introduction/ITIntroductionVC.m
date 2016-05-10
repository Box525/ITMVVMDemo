//
//  ITIntroductionVC.m
//  ChatProject
//
//  Created by Box on 15/9/30.
//  Copyright (c) 2015年 Box. All rights reserved.
//

#import "ITIntroductionVC.h"

@interface ITIntroductionVC ()

@end

@implementation ITIntroductionVC

- (void)dealloc {
    self.block = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 100, 44);
    button.center = self.view.center;
    [button setTitle:@"Enter" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

}

- (void)enterRootVC:(DidSelectedEnter)newBlock {
    self.block = newBlock;
}

#pragma mark - 进入主界面
- (void)enter:(id)sender {
    self.block();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
