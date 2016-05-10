//
//  HDItems.m
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HDItems.h"
#import "HDContents.h"


NSString *const kHDItemsId = @"id";
NSString *const kHDItemsColumnName = @"column_name";
NSString *const kHDItemsPublishTime = @"publish_time";
NSString *const kHDItemsUrl = @"url";
NSString *const kHDItemsTemplate = @"template";
NSString *const kHDItemsContents = @"contents";


@interface HDItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDItems

@synthesize itemsIdentifier = _itemsIdentifier;
@synthesize columnName = _columnName;
@synthesize publishTime = _publishTime;
@synthesize url = _url;
@synthesize template = _template;
@synthesize contents = _contents;


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
            self.itemsIdentifier = [[self objectOrNilForKey:kHDItemsId fromDictionary:dict] doubleValue];
            self.columnName = [self objectOrNilForKey:kHDItemsColumnName fromDictionary:dict];
            self.publishTime = [self objectOrNilForKey:kHDItemsPublishTime fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHDItemsUrl fromDictionary:dict];
            self.template = [[self objectOrNilForKey:kHDItemsTemplate fromDictionary:dict] doubleValue];
            self.contents = [HDContents modelObjectWithDictionary:[dict objectForKey:kHDItemsContents]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsIdentifier] forKey:kHDItemsId];
    [mutableDict setValue:self.columnName forKey:kHDItemsColumnName];
    [mutableDict setValue:self.publishTime forKey:kHDItemsPublishTime];
    [mutableDict setValue:self.url forKey:kHDItemsUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.template] forKey:kHDItemsTemplate];
    [mutableDict setValue:[self.contents dictionaryRepresentation] forKey:kHDItemsContents];

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

    self.itemsIdentifier = [aDecoder decodeDoubleForKey:kHDItemsId];
    self.columnName = [aDecoder decodeObjectForKey:kHDItemsColumnName];
    self.publishTime = [aDecoder decodeObjectForKey:kHDItemsPublishTime];
    self.url = [aDecoder decodeObjectForKey:kHDItemsUrl];
    self.template = [aDecoder decodeDoubleForKey:kHDItemsTemplate];
    self.contents = [aDecoder decodeObjectForKey:kHDItemsContents];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_itemsIdentifier forKey:kHDItemsId];
    [aCoder encodeObject:_columnName forKey:kHDItemsColumnName];
    [aCoder encodeObject:_publishTime forKey:kHDItemsPublishTime];
    [aCoder encodeObject:_url forKey:kHDItemsUrl];
    [aCoder encodeDouble:_template forKey:kHDItemsTemplate];
    [aCoder encodeObject:_contents forKey:kHDItemsContents];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDItems *copy = [[HDItems alloc] init];
    
    if (copy) {

        copy.itemsIdentifier = self.itemsIdentifier;
        copy.columnName = [self.columnName copyWithZone:zone];
        copy.publishTime = [self.publishTime copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.template = self.template;
        copy.contents = [self.contents copyWithZone:zone];
    }
    
    return copy;
}


@end
