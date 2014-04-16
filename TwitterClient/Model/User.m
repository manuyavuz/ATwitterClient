//
//  User.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super initWithDictionary:dict];
    if (self) {
        self.name = dict[@"name"];
        self.screenName = dict[@"screen_name"];
        NSString *bigPath = dict[@"profile_image_url"];
//        NSString *bigPath = [dict[@"profile_image_url"] stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
        self.profileImageURL = [NSURL URLWithString:bigPath];
    }
    return self;
}

@end
