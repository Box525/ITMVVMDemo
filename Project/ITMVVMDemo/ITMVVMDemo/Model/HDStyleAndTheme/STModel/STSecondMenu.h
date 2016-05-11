//
//  STSecondMenu.h
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STSecondMenu : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double classifyId;
@property (nonatomic, strong) NSString *classifyName;
@property (nonatomic, strong) NSString *classifyIcon;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
