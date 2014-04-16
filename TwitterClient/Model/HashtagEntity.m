//
//  HashtagEntity.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "HashtagEntity.h"

@implementation HashtagEntity

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super initWithDictionary:dict];
    if (self) {
        self.text = dict[@"text"];
    }
    return self;
}

@end
