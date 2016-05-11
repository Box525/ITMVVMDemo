//
//  STData.m
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STData.h"
#import "STItems.h"


NSString *const kSTDataKind = @"kind";
NSString *const kSTDataName = @"name";
NSString *const kSTDataItems = @"items";


@interface STData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STData

@synthesize kind = _kind;
@synthesize name = _name;
@synthesize items = _items;


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
            self.kind = [[self objectOrNilForKey:kSTDataKind fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kSTDataName fromDictionary:dict];
    NSObject *receivedSTItems = [dict objectForKey:kSTDataItems];
    NSMutableArray *parsedSTItems = [NSMutableArray array];
    if ([receivedSTItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSTItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSTItems addObject:[STItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSTItems isKindOfClass:[NSDictionary class]]) {
       [parsedSTItems addObject:[STItems modelObjectWithDictionary:(NSDictionary *)receivedSTItems]];
    }

    self.items = [NSArray arrayWithArray:parsedSTItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.kind] forKey:kSTDataKind];
    [mutableDict setValue:self.name forKey:kSTDataName];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kSTDataItems];

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

    self.kind = [aDecoder decodeDoubleForKey:kSTDataKind];
    self.name = [aDecoder decodeObjectForKey:kSTDataName];
    self.items = [aDecoder decodeObjectForKey:kSTDataItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_kind forKey:kSTDataKind];
    [aCoder encodeObject:_name forKey:kSTDataName];
    [aCoder encodeObject:_items forKey:kSTDataItems];
}

- (id)copyWithZone:(NSZone *)zone
{
    STData *copy = [[STData alloc] init];
    
    if (copy) {

        copy.kind = self.kind;
        copy.name = [self.name copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
