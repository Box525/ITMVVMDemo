//
//  HDIssues.h
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HDIssues : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double itemsCount;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) double issueId;
@property (nonatomic, strong) NSArray *todayEvents;
@property (nonatomic, strong) NSString *publishDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
