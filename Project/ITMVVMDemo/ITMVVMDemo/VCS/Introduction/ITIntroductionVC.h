//
//  ITIntroductionVC.h
//  ChatProject
//
//  Created by Box on 15/9/30.
//  Copyright (c) 2015年 Box. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockTypeDefault.h"

@interface ITIntroductionVC : UIViewController

@property (nonatomic,copy) DidSelectedEnter block;

- (void)enterRootVC:(DidSelectedEnter)newBlock;


@end
