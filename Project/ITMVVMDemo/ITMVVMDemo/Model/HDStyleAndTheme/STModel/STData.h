//
//  STData.h
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double kind;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
