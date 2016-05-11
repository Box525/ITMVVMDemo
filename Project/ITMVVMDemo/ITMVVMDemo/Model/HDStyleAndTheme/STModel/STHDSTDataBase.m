//
//  STHDSTDataBase.m
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STHDSTDataBase.h"
#import "STUser.h"
#import "STData.h"


NSString *const kSTHDSTDataBaseUser = @"user";
NSString *const kSTHDSTDataBaseData = @"data";


@interface STHDSTDataBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STHDSTDataBase

@synthesize user = _user;
@synthesize data = _data;


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
            self.user = [STUser modelObjectWithDictionary:[dict objectForKey:kSTHDSTDataBaseUser]];
    NSObject *receivedSTData = [dict objectForKey:kSTHDSTDataBaseData];
    NSMutableArray *parsedSTData = [NSMutableArray array];
    if ([receivedSTData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSTData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSTData addObject:[STData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSTData isKindOfClass:[NSDictionary class]]) {
       [parsedSTData addObject:[STData modelObjectWithDictionary:(NSDictionary *)receivedSTData]];
    }

    self.data = [NSArray arrayWithArray:parsedSTData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kSTHDSTDataBaseUser];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kSTHDSTDataBaseData];

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

    self.user = [aDecoder decodeObjectForKey:kSTHDSTDataBaseUser];
    self.data = [aDecoder decodeObjectForKey:kSTHDSTDataBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_user forKey:kSTHDSTDataBaseUser];
    [aCoder encodeObject:_data forKey:kSTHDSTDataBaseData];
}

- (id)copyWithZone:(NSZone *)zone
{
    STHDSTDataBase *copy = [[STHDSTDataBase alloc] init];
    
    if (copy) {

        copy.user = [self.user copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
