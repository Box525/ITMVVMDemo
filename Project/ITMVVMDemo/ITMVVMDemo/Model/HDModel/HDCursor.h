//
//  HDCursor.h
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HDCursor : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *prev;
@property (nonatomic, assign) BOOL hasPrev;
@property (nonatomic, strong) NSString *next;
@property (nonatomic, assign) BOOL hasNext;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
