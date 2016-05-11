//
//  STUser.h
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *memberType;
@property (nonatomic, strong) NSString *loginStatusMsg;
@property (nonatomic, strong) NSString *loginStatus;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
