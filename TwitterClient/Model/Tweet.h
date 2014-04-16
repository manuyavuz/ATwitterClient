//
//  TweetObject.h
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "BaseObject.h"
#import "User.h"
#import "HashtagEntity.h"
#import "URLEntity.h"
#import "MentionEntity.h"
@interface Tweet : BaseObject

@property (nonatomic, copy)     NSString        *text;
@property (nonatomic, strong)   NSDate          *date;
@property (nonatomic, strong)   User            *user;
@property (nonatomic, strong)   URLEntity       *urlEntity;
@property (nonatomic, strong)   HashtagEntity   *hashtagEntity;
@property (nonatomic, strong)   MentionEntity   *mentionEntity;


@end
