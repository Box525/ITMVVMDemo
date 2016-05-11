//
//  STItems.m
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STItems.h"
#import "STSecondMenu.h"


NSString *const kSTItemsClassifyIcon = @"classify_icon";
NSString *const kSTItemsClassifyName = @"classify_name";
NSString *const kSTItemsSecondMenu = @"secondMenu";
NSString *const kSTItemsClassifyId = @"classify_id";


@interface STItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STItems

@synthesize classifyIcon = _classifyIcon;
@synthesize classifyName = _classifyName;
@synthesize secondMenu = _secondMenu;
@synthesize classifyId = _classifyId;


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
            self.classifyIcon = [self objectOrNilForKey:kSTItemsClassifyIcon fromDictionary:dict];
            self.classifyName = [self objectOrNilForKey:kSTItemsClassifyName fromDictionary:dict];
    NSObject *receivedSTSecondMenu = [dict objectForKey:kSTItemsSecondMenu];
    NSMutableArray *parsedSTSecondMenu = [NSMutableArray array];
    if ([receivedSTSecondMenu isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSTSecondMenu) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSTSecondMenu addObject:[STSecondMenu modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSTSecondMenu isKindOfClass:[NSDictionary class]]) {
       [parsedSTSecondMenu addObject:[STSecondMenu modelObjectWithDictionary:(NSDictionary *)receivedSTSecondMenu]];
    }

    self.secondMenu = [NSArray arrayWithArray:parsedSTSecondMenu];
            self.classifyId = [[self objectOrNilForKey:kSTItemsClassifyId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.classifyIcon forKey:kSTItemsClassifyIcon];
    [mutableDict setValue:self.classifyName forKey:kSTItemsClassifyName];
    NSMutableArray *tempArrayForSecondMenu = [NSMutableArray array];
    for (NSObject *subArrayObject in self.secondMenu) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSecondMenu addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSecondMenu addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSecondMenu] forKey:kSTItemsSecondMenu];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classifyId] forKey:kSTItemsClassifyId];

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

    self.classifyIcon = [aDecoder decodeObjectForKey:kSTItemsClassifyIcon];
    self.classifyName = [aDecoder decodeObjectForKey:kSTItemsClassifyName];
    self.secondMenu = [aDecoder decodeObjectForKey:kSTItemsSecondMenu];
    self.classifyId = [aDecoder decodeDoubleForKey:kSTItemsClassifyId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_classifyIcon forKey:kSTItemsClassifyIcon];
    [aCoder encodeObject:_classifyName forKey:kSTItemsClassifyName];
    [aCoder encodeObject:_secondMenu forKey:kSTItemsSecondMenu];
    [aCoder encodeDouble:_classifyId forKey:kSTItemsClassifyId];
}

- (id)copyWithZone:(NSZone *)zone
{
    STItems *copy = [[STItems alloc] init];
    
    if (copy) {

        copy.classifyIcon = [self.classifyIcon copyWithZone:zone];
        copy.classifyName = [self.classifyName copyWithZone:zone];
        copy.secondMenu = [self.secondMenu copyWithZone:zone];
        copy.classifyId = self.classifyId;
    }
    
    return copy;
}


@end
