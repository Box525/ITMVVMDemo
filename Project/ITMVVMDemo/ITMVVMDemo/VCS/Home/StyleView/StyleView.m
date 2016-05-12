//
//  StyleView.m
//  ITMVVMDemo
//
//  Created by Box on 16/5/11.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "StyleView.h"
#import "STDataModels.h"


@interface StyleView (){
    UILabel *_text;
}

@property(nonatomic,copy)CallBackMessageBlock block;


@end

@implementation StyleView

- (void)dealloc {
    self.block = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setCallBack:(CallBackMessageBlock)newBlock {
    self.block = newBlock;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *styleLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 60, 20)];
    styleLable.text = @"";
    styleLable.textColor = [UIColor darkGrayColor];
    styleLable.font = [UIFont systemFontOfSize:12.0f];
    [self addSubview:styleLable];
    _text = styleLable;
}

- (void)setModelD:(STHDSTDataBase *)modelD {
    _modelD = modelD;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    STHDSTDataBase *model = self.modelD;
    if (!model) {
        return;
    }
    
    STData *data = model.data[0];
    _text.text = data.name;
    
    
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
