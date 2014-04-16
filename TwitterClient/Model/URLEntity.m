//
//  URLEntity.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "URLEntity.h"

@implementation URLEntity

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super initWithDictionary:dict];
    if (self) {
        self.URL = [NSURL URLWithString:dict[@"url"]];
    }
    return self;
}

@end
