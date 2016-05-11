//
//  STItems.h
//
//  Created by Box  on 16/5/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *classifyIcon;
@property (nonatomic, strong) NSString *classifyName;
@property (nonatomic, strong) NSArray *secondMenu;
@property (nonatomic, assign) double classifyId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
