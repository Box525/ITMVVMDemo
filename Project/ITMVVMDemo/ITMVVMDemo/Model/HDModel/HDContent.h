//
//  HDContent.h
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HDCursor;

@interface HDContent : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSArray *issues;
@property (nonatomic, strong) HDCursor *cursor;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
