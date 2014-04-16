//
//  TweetObject.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super initWithDictionary:dict];
    if (self) {
        self.text = dict[@"text"];
        NSString *dateStr = dict[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        self.date = [formatter dateFromString:dateStr];
        if(dict[@"entities"])
        {
            NSDictionary *entities = dict[@"entities"];
            if(entities[@"urls"] && [entities[@"urls"] count])
            {
                self.urlEntity = [[URLEntity alloc] initWithDictionary:(entities[@"urls"])[0]];
            }
            if(entities[@"hashtags"] && [entities[@"hashtags"] count])
            {
                self.hashtagEntity = [[HashtagEntity alloc] initWithDictionary:(entities[@"hashtags"])[0]];
            }
            if(entities[@"user_mentions"] && [entities[@"user_mentions"] count])
            {
                self.mentionEntity = [[MentionEntity alloc] initWithDictionary:(entities[@"user_mentions"])[0]];
            }
        }
        if(dict[@"user"])
        {
            self.user = [[User alloc] initWithDictionary:dict[@"user"]];
        }
    }
    return self;
}


@end
