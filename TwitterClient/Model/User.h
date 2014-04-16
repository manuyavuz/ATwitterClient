//
//  User.h
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "BaseObject.h"

@interface User : BaseObject

@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, copy)     NSString    *screenName;
@property (nonatomic, strong)   NSURL       *profileImageURL;
@property (nonatomic, strong)   UIImage     *profileImage;
@end
