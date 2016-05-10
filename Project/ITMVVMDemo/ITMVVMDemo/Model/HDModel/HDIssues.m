//
//  HDIssues.m
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HDIssues.h"
#import "HDItems.h"


NSString *const kHDIssuesItemsCount = @"items_count";
NSString *const kHDIssuesTitle = @"title";
NSString *const kHDIssuesItems = @"items";
NSString *const kHDIssuesIssueId = @"issue_id";
NSString *const kHDIssuesTodayEvents = @"today_events";
NSString *const kHDIssuesPublishDate = @"publish_date";


@interface HDIssues ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDIssues

@synthesize itemsCount = _itemsCount;
@synthesize title = _title;
@synthesize items = _items;
@synthesize issueId = _issueId;
@synthesize todayEvents = _todayEvents;
@synthesize publishDate = _publishDate;


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
            self.itemsCount = [[self objectOrNilForKey:kHDIssuesItemsCount fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kHDIssuesTitle fromDictionary:dict];
    NSObject *receivedHDItems = [dict objectForKey:kHDIssuesItems];
    NSMutableArray *parsedHDItems = [NSMutableArray array];
    if ([receivedHDItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHDItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHDItems addObject:[HDItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHDItems isKindOfClass:[NSDictionary class]]) {
       [parsedHDItems addObject:[HDItems modelObjectWithDictionary:(NSDictionary *)receivedHDItems]];
    }

    self.items = [NSArray arrayWithArray:parsedHDItems];
            self.issueId = [[self objectOrNilForKey:kHDIssuesIssueId fromDictionary:dict] doubleValue];
            self.todayEvents = [self objectOrNilForKey:kHDIssuesTodayEvents fromDictionary:dict];
            self.publishDate = [self objectOrNilForKey:kHDIssuesPublishDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsCount] forKey:kHDIssuesItemsCount];
    [mutableDict setValue:self.title forKey:kHDIssuesTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kHDIssuesItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.issueId] forKey:kHDIssuesIssueId];
    NSMutableArray *tempArrayForTodayEvents = [NSMutableArray array];
    for (NSObject *subArrayObject in self.todayEvents) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTodayEvents addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTodayEvents addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTodayEvents] forKey:kHDIssuesTodayEvents];
    [mutableDict setValue:self.publishDate forKey:kHDIssuesPublishDate];

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

    self.itemsCount = [aDecoder decodeDoubleForKey:kHDIssuesItemsCount];
    self.title = [aDecoder decodeObjectForKey:kHDIssuesTitle];
    self.items = [aDecoder decodeObjectForKey:kHDIssuesItems];
    self.issueId = [aDecoder decodeDoubleForKey:kHDIssuesIssueId];
    self.todayEvents = [aDecoder decodeObjectForKey:kHDIssuesTodayEvents];
    self.publishDate = [aDecoder decodeObjectForKey:kHDIssuesPublishDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_itemsCount forKey:kHDIssuesItemsCount];
    [aCoder encodeObject:_title forKey:kHDIssuesTitle];
    [aCoder encodeObject:_items forKey:kHDIssuesItems];
    [aCoder encodeDouble:_issueId forKey:kHDIssuesIssueId];
    [aCoder encodeObject:_todayEvents forKey:kHDIssuesTodayEvents];
    [aCoder encodeObject:_publishDate forKey:kHDIssuesPublishDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDIssues *copy = [[HDIssues alloc] init];
    
    if (copy) {

        copy.itemsCount = self.itemsCount;
        copy.title = [self.title copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.issueId = self.issueId;
        copy.todayEvents = [self.todayEvents copyWithZone:zone];
        copy.publishDate = [self.publishDate copyWithZone:zone];
    }
    
    return copy;
}


@end
