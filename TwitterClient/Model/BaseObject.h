//
//  BaseObject.h
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseObject : NSObject

@property (nonatomic, assign) long long idx;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@end
