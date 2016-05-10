//
//  HDContents.m
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HDContents.h"
#import "HDAuthor.h"
#import "HDImage.h"


NSString *const kHDContentsWhisper = @"whisper";
NSString *const kHDContentsNDishes = @"n_dishes";
NSString *const kHDContentsAuthor = @"author";
NSString *const kHDContentsNCooked = @"n_cooked";
NSString *const kHDContentsDesc = @"desc";
NSString *const kHDContentsTitle = @"title";
NSString *const kHDContentsRecipeId = @"recipe_id";
NSString *const kHDContentsVideoUrl = @"video_url";
NSString *const kHDContentsImage = @"image";
NSString *const kHDContentsTitle2nd = @"title_2nd";
NSString *const kHDContentsTitle1st = @"title_1st";
NSString *const kHDContentsScore = @"score";


@interface HDContents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDContents

@synthesize whisper = _whisper;
@synthesize nDishes = _nDishes;
@synthesize author = _author;
@synthesize nCooked = _nCooked;
@synthesize desc = _desc;
@synthesize title = _title;
@synthesize recipeId = _recipeId;
@synthesize videoUrl = _videoUrl;
@synthesize image = _image;
@synthesize title2nd = _title2nd;
@synthesize title1st = _title1st;
@synthesize score = _score;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.whisper = [self objectOrNilForKey:kHDContentsWhisper fromDictionary:dict];
            self.nDishes = [self objectOrNilForKey:kHDContentsNDishes fromDictionary:dict];
            self.author = [HDAuthor modelObjectWithDictionary:[dict objectForKey:kHDContentsAuthor]];
            self.nCooked = [self objectOrNilForKey:kHDContentsNCooked fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kHDContentsDesc fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHDContentsTitle fromDictionary:dict];
            self.recipeId = [self objectOrNilForKey:kHDContentsRecipeId fromDictionary:dict];
            self.videoUrl = [self objectOrNilForKey:kHDContentsVideoUrl fromDictionary:dict];
            self.image = [HDImage modelObjectWithDictionary:[dict objectForKey:kHDContentsImage]];
            self.title2nd = [self objectOrNilForKey:kHDContentsTitle2nd fromDictionary:dict];
            self.title1st = [self objectOrNilForKey:kHDContentsTitle1st fromDictionary:dict];
            self.score = [self objectOrNilForKey:kHDContentsScore fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.whisper forKey:kHDContentsWhisper];
    [mutableDict setValue:self.nDishes forKey:kHDContentsNDishes];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:kHDContentsAuthor];
    [mutableDict setValue:self.nCooked forKey:kHDContentsNCooked];
    [mutableDict setValue:self.desc forKey:kHDContentsDesc];
    [mutableDict setValue:self.title forKey:kHDContentsTitle];
    [mutableDict setValue:self.recipeId forKey:kHDContentsRecipeId];
    [mutableDict setValue:self.videoUrl forKey:kHDContentsVideoUrl];
    [mutableDict setValue:[self.image dictionaryRepresentation] forKey:kHDContentsImage];
    [mutableDict setValue:self.title2nd forKey:kHDContentsTitle2nd];
    [mutableDict setValue:self.title1st forKey:kHDContentsTitle1st];
    [mutableDict setValue:self.score forKey:kHDContentsScore];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.whisper = [aDecoder decodeObjectForKey:kHDContentsWhisper];
    self.nDishes = [aDecoder decodeObjectForKey:kHDContentsNDishes];
    self.author = [aDecoder decodeObjectForKey:kHDContentsAuthor];
    self.nCooked = [aDecoder decodeObjectForKey:kHDContentsNCooked];
    self.desc = [aDecoder decodeObjectForKey:kHDContentsDesc];
    self.title = [aDecoder decodeObjectForKey:kHDContentsTitle];
    self.recipeId = [aDecoder decodeObjectForKey:kHDContentsRecipeId];
    self.videoUrl = [aDecoder decodeObjectForKey:kHDContentsVideoUrl];
    self.image = [aDecoder decodeObjectForKey:kHDContentsImage];
    self.title2nd = [aDecoder decodeObjectForKey:kHDContentsTitle2nd];
    self.title1st = [aDecoder decodeObjectForKey:kHDContentsTitle1st];
    self.score = [aDecoder decodeObjectForKey:kHDContentsScore];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_whisper forKey:kHDContentsWhisper];
    [aCoder encodeObject:_nDishes forKey:kHDContentsNDishes];
    [aCoder encodeObject:_author forKey:kHDContentsAuthor];
    [aCoder encodeObject:_nCooked forKey:kHDContentsNCooked];
    [aCoder encodeObject:_desc forKey:kHDContentsDesc];
    [aCoder encodeObject:_title forKey:kHDContentsTitle];
    [aCoder encodeObject:_recipeId forKey:kHDContentsRecipeId];
    [aCoder encodeObject:_videoUrl forKey:kHDContentsVideoUrl];
    [aCoder encodeObject:_image forKey:kHDContentsImage];
    [aCoder encodeObject:_title2nd forKey:kHDContentsTitle2nd];
    [aCoder encodeObject:_title1st forKey:kHDContentsTitle1st];
    [aCoder encodeObject:_score forKey:kHDContentsScore];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDContents *copy = [[HDContents alloc] init];
    
    if (copy) {

        copy.whisper = [self.whisper copyWithZone:zone];
        copy.nDishes = [self.nDishes copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.nCooked = [self.nCooked copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.recipeId = [self.recipeId copyWithZone:zone];
        copy.videoUrl = [self.videoUrl copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.title2nd = [self.title2nd copyWithZone:zone];
        copy.title1st = [self.title1st copyWithZone:zone];
        copy.score = [self.score copyWithZone:zone];
    }
    
    return copy;
}


@end
