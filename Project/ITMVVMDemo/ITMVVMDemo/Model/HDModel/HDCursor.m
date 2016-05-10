//
//  HDCursor.m
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HDCursor.h"


NSString *const kHDCursorPrev = @"prev";
NSString *const kHDCursorHasPrev = @"has_prev";
NSString *const kHDCursorNext = @"next";
NSString *const kHDCursorHasNext = @"has_next";


@interface HDCursor ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDCursor

@synthesize prev = _prev;
@synthesize hasPrev = _hasPrev;
@synthesize next = _next;
@synthesize hasNext = _hasNext;


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
            self.prev = [self objectOrNilForKey:kHDCursorPrev fromDictionary:dict];
            self.hasPrev = [[self objectOrNilForKey:kHDCursorHasPrev fromDictionary:dict] boolValue];
            self.next = [self objectOrNilForKey:kHDCursorNext fromDictionary:dict];
            self.hasNext = [[self objectOrNilForKey:kHDCursorHasNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.prev forKey:kHDCursorPrev];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasPrev] forKey:kHDCursorHasPrev];
    [mutableDict setValue:self.next forKey:kHDCursorNext];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNext] forKey:kHDCursorHasNext];

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

    self.prev = [aDecoder decodeObjectForKey:kHDCursorPrev];
    self.hasPrev = [aDecoder decodeBoolForKey:kHDCursorHasPrev];
    self.next = [aDecoder decodeObjectForKey:kHDCursorNext];
    self.hasNext = [aDecoder decodeBoolForKey:kHDCursorHasNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_prev forKey:kHDCursorPrev];
    [aCoder encodeBool:_hasPrev forKey:kHDCursorHasPrev];
    [aCoder encodeObject:_next forKey:kHDCursorNext];
    [aCoder encodeBool:_hasNext forKey:kHDCursorHasNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDCursor *copy = [[HDCursor alloc] init];
    
    if (copy) {

        copy.prev = [self.prev copyWithZone:zone];
        copy.hasPrev = self.hasPrev;
        copy.next = [self.next copyWithZone:zone];
        copy.hasNext = self.hasNext;
    }
    
    return copy;
}


@end
