//
//  ImageUtil.h
//  TwitterClient
//
//  Created by kerem on 19/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUtil : NSObject
+ (UIImage*)resizeImage:(UIImage*)image withWidth:(int)width withHeight:(int)height;
@end
