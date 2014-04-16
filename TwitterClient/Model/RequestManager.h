//
//  RequestManager.h
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RequestTypeTimeline,
    RequestTypeProfile,
    RequestTypeSearch,
    RequestTypeSendTweet
}RequestType;

typedef void(^ResponseBlock)(BOOL succeeded,id response, NSError* error);


@interface RequestManager : NSObject

+ (instancetype)sharedManager;

- (void)requestWithRequestType:(RequestType)type completion:(ResponseBlock)block;

@end
