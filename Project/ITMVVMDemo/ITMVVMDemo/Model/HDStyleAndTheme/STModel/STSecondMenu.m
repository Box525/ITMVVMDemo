//
//  STSecondMenu.m
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STSecondMenu.h"


NSString *const kSTSecondMenuClassifyId = @"classify_id";
NSString *const kSTSecondMenuClassifyName = @"classify_name";
NSString *const kSTSecondMenuClassifyIcon = @"classify_icon";


@interface STSecondMenu ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STSecondMenu

@synthesize classifyId = _classifyId;
@synthesize classifyName = _classifyName;
@synthesize classifyIcon = _classifyIcon;


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
            self.classifyId = [[self objectOrNilForKey:kSTSecondMenuClassifyId fromDictionary:dict] doubleValue];
            self.classifyName = [self objectOrNilForKey:kSTSecondMenuClassifyName fromDictionary:dict];
            self.classifyIcon = [self objectOrNilForKey:kSTSecondMenuClassifyIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classifyId] forKey:kSTSecondMenuClassifyId];
    [mutableDict setValue:self.classifyName forKey:kSTSecondMenuClassifyName];
    [mutableDict setValue:self.classifyIcon forKey:kSTSecondMenuClassifyIcon];

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

    self.classifyId = [aDecoder decodeDoubleForKey:kSTSecondMenuClassifyId];
    self.classifyName = [aDecoder decodeObjectForKey:kSTSecondMenuClassifyName];
    self.classifyIcon = [aDecoder decodeObjectForKey:kSTSecondMenuClassifyIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_classifyId forKey:kSTSecondMenuClassifyId];
    [aCoder encodeObject:_classifyName forKey:kSTSecondMenuClassifyName];
    [aCoder encodeObject:_classifyIcon forKey:kSTSecondMenuClassifyIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    STSecondMenu *copy = [[STSecondMenu alloc] init];
    
    if (copy) {

        copy.classifyId = self.classifyId;
        copy.classifyName = [self.classifyName copyWithZone:zone];
        copy.classifyIcon = [self.classifyIcon copyWithZone:zone];
    }
    
    return copy;
}


@end
