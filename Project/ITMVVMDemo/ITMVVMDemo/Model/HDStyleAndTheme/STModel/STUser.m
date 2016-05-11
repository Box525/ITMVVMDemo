//
//  STUser.m
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STUser.h"


NSString *const kSTUserMemberType = @"member_type";
NSString *const kSTUserLoginStatusMsg = @"login_status_msg";
NSString *const kSTUserLoginStatus = @"login_status";


@interface STUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STUser

@synthesize memberType = _memberType;
@synthesize loginStatusMsg = _loginStatusMsg;
@synthesize loginStatus = _loginStatus;


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
            self.memberType = [self objectOrNilForKey:kSTUserMemberType fromDictionary:dict];
            self.loginStatusMsg = [self objectOrNilForKey:kSTUserLoginStatusMsg fromDictionary:dict];
            self.loginStatus = [self objectOrNilForKey:kSTUserLoginStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.memberType forKey:kSTUserMemberType];
    [mutableDict setValue:self.loginStatusMsg forKey:kSTUserLoginStatusMsg];
    [mutableDict setValue:self.loginStatus forKey:kSTUserLoginStatus];

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

    self.memberType = [aDecoder decodeObjectForKey:kSTUserMemberType];
    self.loginStatusMsg = [aDecoder decodeObjectForKey:kSTUserLoginStatusMsg];
    self.loginStatus = [aDecoder decodeObjectForKey:kSTUserLoginStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_memberType forKey:kSTUserMemberType];
    [aCoder encodeObject:_loginStatusMsg forKey:kSTUserLoginStatusMsg];
    [aCoder encodeObject:_loginStatus forKey:kSTUserLoginStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    STUser *copy = [[STUser alloc] init];
    
    if (copy) {

        copy.memberType = [self.memberType copyWithZone:zone];
        copy.loginStatusMsg = [self.loginStatusMsg copyWithZone:zone];
        copy.loginStatus = [self.loginStatus copyWithZone:zone];
    }
    
    return copy;
}


@end
