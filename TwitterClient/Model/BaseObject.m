//
//  BaseObject.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "BaseObject.h"

@implementation BaseObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.idx = NSNotFound;
        
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [self init];
    if (self) {
        if(dict[@"id"])
        {
            NSNumber *num = dict[@"id"];
            self.idx = [dict[@"id"] longLongValue];
        }
    }
    return self;
}

@end
