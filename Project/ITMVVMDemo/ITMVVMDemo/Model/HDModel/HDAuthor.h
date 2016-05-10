//
//  HDAuthor.h
//
//  Created by Box  on 16/4/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HDAuthor : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *authorIdentifier;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
