//
//  MentionEntity.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "MentionEntity.h"

@implementation MentionEntity

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super initWithDictionary:dict];
    if (self) {
        self.name = dict[@"name"];
        self.screenName = dict[@"screen_name"];
    }
    return self;
}


@end
