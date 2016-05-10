//
//  HDItems.h
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HDContents;

@interface HDItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double itemsIdentifier;
@property (nonatomic, strong) NSString *columnName;
@property (nonatomic, strong) NSString *publishTime;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double template;
@property (nonatomic, strong) HDContents *contents;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
