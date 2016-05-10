//
//  HDImage.m
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HDImage.h"


NSString *const kHDImageUrl = @"url";
NSString *const kHDImageWidth = @"width";
NSString *const kHDImageHeight = @"height";


@interface HDImage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDImage

@synthesize url = _url;
@synthesize width = _width;
@synthesize height = _height;


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
            self.url = [self objectOrNilForKey:kHDImageUrl fromDictionary:dict];
            self.width = [self objectOrNilForKey:kHDImageWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kHDImageHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kHDImageUrl];
    [mutableDict setValue:self.width forKey:kHDImageWidth];
    [mutableDict setValue:self.height forKey:kHDImageHeight];

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

    self.url = [aDecoder decodeObjectForKey:kHDImageUrl];
    self.width = [aDecoder decodeObjectForKey:kHDImageWidth];
    self.height = [aDecoder decodeObjectForKey:kHDImageHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kHDImageUrl];
    [aCoder encodeObject:_width forKey:kHDImageWidth];
    [aCoder encodeObject:_height forKey:kHDImageHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDImage *copy = [[HDImage alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
