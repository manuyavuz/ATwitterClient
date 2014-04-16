//
//  MentionEntity.h
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "TweetEntity.h"

@interface MentionEntity : TweetEntity

@property (nonatomic, copy) NSString    *name;
@property (nonatomic, copy) NSString    *screenName;

@end
