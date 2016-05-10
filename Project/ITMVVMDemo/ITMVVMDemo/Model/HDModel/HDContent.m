//
//  HDContent.m
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HDContent.h"
#import "HDIssues.h"
#import "HDCursor.h"


NSString *const kHDContentCount = @"count";
NSString *const kHDContentIssues = @"issues";
NSString *const kHDContentCursor = @"cursor";


@interface HDContent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDContent

@synthesize count = _count;
@synthesize issues = _issues;
@synthesize cursor = _cursor;


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
            self.count = [[self objectOrNilForKey:kHDContentCount fromDictionary:dict] doubleValue];
    NSObject *receivedHDIssues = [dict objectForKey:kHDContentIssues];
    NSMutableArray *parsedHDIssues = [NSMutableArray array];
    if ([receivedHDIssues isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHDIssues) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHDIssues addObject:[HDIssues modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHDIssues isKindOfClass:[NSDictionary class]]) {
       [parsedHDIssues addObject:[HDIssues modelObjectWithDictionary:(NSDictionary *)receivedHDIssues]];
    }

    self.issues = [NSArray arrayWithArray:parsedHDIssues];
            self.cursor = [HDCursor modelObjectWithDictionary:[dict objectForKey:kHDContentCursor]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kHDContentCount];
    NSMutableArray *tempArrayForIssues = [NSMutableArray array];
    for (NSObject *subArrayObject in self.issues) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIssues addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIssues addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIssues] forKey:kHDContentIssues];
    [mutableDict setValue:[self.cursor dictionaryRepresentation] forKey:kHDContentCursor];

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

    self.count = [aDecoder decodeDoubleForKey:kHDContentCount];
    self.issues = [aDecoder decodeObjectForKey:kHDContentIssues];
    self.cursor = [aDecoder decodeObjectForKey:kHDContentCursor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_count forKey:kHDContentCount];
    [aCoder encodeObject:_issues forKey:kHDContentIssues];
    [aCoder encodeObject:_cursor forKey:kHDContentCursor];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDContent *copy = [[HDContent alloc] init];
    
    if (copy) {

        copy.count = self.count;
        copy.issues = [self.issues copyWithZone:zone];
        copy.cursor = [self.cursor copyWithZone:zone];
    }
    
    return copy;
}


@end
