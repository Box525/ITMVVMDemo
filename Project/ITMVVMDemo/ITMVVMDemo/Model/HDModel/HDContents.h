//
//  HDContents.h
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HDAuthor, HDImage;

@interface HDContents : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *whisper;
@property (nonatomic, strong) NSString *nDishes;
@property (nonatomic, strong) HDAuthor *author;
@property (nonatomic, strong) NSString *nCooked;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *recipeId;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) HDImage *image;
@property (nonatomic, strong) NSString *title2nd;
@property (nonatomic, strong) NSString *title1st;
@property (nonatomic, strong) NSString *score;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
