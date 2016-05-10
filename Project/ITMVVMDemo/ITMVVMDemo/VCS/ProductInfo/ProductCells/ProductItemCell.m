//
//  ProductItemCell.m
//  ITMVVMDemo
//
//  Created by Box on 16/4/7.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "ProductItemCell.h"

@interface ProductItemCell (){
    UIImageView *_userHead;
    UILabel *_userName;
    UILabel *_descText;
    UIImageView *_photo;
    UIImageView *_like;
}

@end

@implementation ProductItemCell

- (void)dealloc{
    self.item = nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup {
    UIImageView *headView = [UIImageView new];
    
    UILabel *nameLable = [UILabel new];
    nameLable.backgroundColor = [UIColor greenColor];
    nameLable.font = [UIFont systemFontOfSize:11];
    nameLable.textColor = [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    
    UILabel *descLable = [UILabel new];
    descLable.backgroundColor = [UIColor greenColor];
    descLable.numberOfLines = 0;
    descLable.font = [UIFont systemFontOfSize:11];
    descLable.textColor = [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    
    UIImageView * pPhoto = [UIImageView new];
    
    UIImageView * likePhoto = [UIImageView new];
    likePhoto.image = [UIImage imageNamed:@"Like.png"];
    
    
    [self.contentView sd_addSubviews:@[headView,nameLable,descLable,pPhoto,likePhoto]];
    
    CGFloat margin = 10;
    headView.sd_layout
    .leftSpaceToView(self.contentView,margin)
    .topSpaceToView(self.contentView,margin)
    .widthIs(50)
    .heightIs(50);
    
    nameLable.sd_layout
    .leftSpaceToView(headView,margin)
    .topEqualToView(headView)
    .heightRatioToView(headView,0.4);
//    .heightIs(14);
    [nameLable setSingleLineAutoResizeWithMaxWidth:200];
    
    descLable.sd_layout
    .topSpaceToView(nameLable,margin)
    .leftEqualToView(nameLable)
    .rightSpaceToView(self.contentView,margin)
    .autoHeightRatio(0);
    
    pPhoto.sd_layout
    .topSpaceToView(descLable,margin)
    .leftEqualToView(descLable)
    .widthRatioToView(descLable,0.7);
    
    likePhoto.sd_layout
    .rightSpaceToView(self.contentView ,margin)
    .widthIs(20)
    .heightIs(20);
    
    _userHead = headView;
    _userName = nameLable;
    _descText = descLable;
    _photo    = pPhoto;
    _like     = likePhoto;
    
}

- (void)setItem:(HDItems *)item {
    _item = item;
    
    NSURL *photoURL = [NSURL URLWithString:_item.contents.author.photo];
    [_userHead sd_setImageWithURL:photoURL placeholderImage:[UIImage imageNamed:@"ff_IconShowAlbum.png"]];
    
    NSString *name = _item.contents.author.name;
    
    if (name) {
//        CGSize size = [name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]}];
//        _userName.sd_layout
//        .widthIs(size.width)
//        .heightIs(size.height);
        
        [_userName sizeToFit];
        _userName.text = _item.contents.author.name;
    }else{
//        CGSize size = [@"主人很懒,没有昵称" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]}];
//        _userName.sd_layout
//        .widthIs(size.width)
//        .heightIs(size.height);
        [_userName sizeToFit];
        _userName.text = @"主人很懒,没有昵称";
    }
    
    NSString *descString = _item.contents.desc;
    if (descString) {
        _descText.text = descString;
    }else{
        _descText.text = @"主人很懒,吃货一名,没有留下👣!!!!";
    }
    
    CGFloat bottomMargin = 0;
    
    NSString *photoURLString = _item.contents.image.url;
    if (photoURLString) {
        CGFloat w = _item.contents.image.width.integerValue;
        CGFloat h = _item.contents.image.height.integerValue;
        CGFloat scale = h/w;
        _photo.sd_layout.autoHeightRatio(scale);
        [_photo sd_setImageWithURL:[NSURL URLWithString:photoURLString]];
        bottomMargin = 10;
        _like.sd_layout
        .bottomEqualToView(_photo);
    }else{
        _photo.sd_layout.autoHeightRatio(0);
    }
    
    [self setupAutoHeightWithBottomView:_like bottomMargin:bottomMargin];
}



@end










