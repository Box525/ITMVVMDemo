//
//  HDAuthor.m
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HDAuthor.h"


NSString *const kHDAuthorId = @"id";
NSString *const kHDAuthorUrl = @"url";
NSString *const kHDAuthorPhoto = @"photo";
NSString *const kHDAuthorName = @"name";


@interface HDAuthor ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDAuthor

@synthesize authorIdentifier = _authorIdentifier;
@synthesize url = _url;
@synthesize photo = _photo;
@synthesize name = _name;


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
            self.authorIdentifier = [self objectOrNilForKey:kHDAuthorId fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHDAuthorUrl fromDictionary:dict];
            self.photo = [self objectOrNilForKey:kHDAuthorPhoto fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHDAuthorName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.authorIdentifier forKey:kHDAuthorId];
    [mutableDict setValue:self.url forKey:kHDAuthorUrl];
    [mutableDict setValue:self.photo forKey:kHDAuthorPhoto];
    [mutableDict setValue:self.name forKey:kHDAuthorName];

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

    self.authorIdentifier = [aDecoder decodeObjectForKey:kHDAuthorId];
    self.url = [aDecoder decodeObjectForKey:kHDAuthorUrl];
    self.photo = [aDecoder decodeObjectForKey:kHDAuthorPhoto];
    self.name = [aDecoder decodeObjectForKey:kHDAuthorName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_authorIdentifier forKey:kHDAuthorId];
    [aCoder encodeObject:_url forKey:kHDAuthorUrl];
    [aCoder encodeObject:_photo forKey:kHDAuthorPhoto];
    [aCoder encodeObject:_name forKey:kHDAuthorName];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDAuthor *copy = [[HDAuthor alloc] init];
    
    if (copy) {

        copy.authorIdentifier = [self.authorIdentifier copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.photo = [self.photo copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
