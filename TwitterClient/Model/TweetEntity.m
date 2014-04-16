//
//  TweetEntity.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "TweetEntity.h"

@implementation TweetEntity

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super initWithDictionary:dict];
    if (self) {
        NSArray *indices = dict[@"indices"];
        NSUInteger startIndex = [indices[0] integerValue];
        NSUInteger endIndex = [indices[1] integerValue];
        self.range = NSMakeRange(startIndex, endIndex - startIndex);
    }
    return self;
}


@end
