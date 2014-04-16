//
//  RequestManager.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "RequestManager.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface RequestManager ()

@property (nonatomic, strong) ACAccountStore *accountStore;

@end


@implementation RequestManager

- (ACAccountStore *)accountStore
{
    if(!_accountStore)
    {
        _accountStore = [[ACAccountStore alloc] init];
    }
    return _accountStore;
}

#pragma mark - singleton

+ (instancetype)sharedManager
{
    static id _manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


- (void)requestWithRequestType:(RequestType)type completion:(ResponseBlock)block
{
    ACAccountType *accountType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [self.accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
        if(granted)
        {
            ACAccount *account = [self.accountStore accountsWithAccountType:accountType][0];
            NSURL *url = nil;
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            switch (type) {
                case RequestTypeTimeline:
                    url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];
                    [params setObject:@"true" forKey:@"exclude_replies"];
//                    [params setObject:@"2" forKey:@"count"];
                    break;
                default:
                    break;
            }
            
            //send request
            
            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:url parameters:params];
            
            request.account = account;
            
            [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                if(responseData)
                {
                    if(urlResponse.statusCode >= 200 && urlResponse.statusCode < 300)
                    {
                        NSError *jsonError = nil;
                        id responseObject = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments | NSJSONReadingMutableContainers error:&jsonError];
                        if(responseObject)
                        {
                            block(YES,responseObject,nil);
                        }
                        else
                        {
                            block(NO,nil,error);
                        }
                    }
                    else
                    {
                        block(NO,nil,error);
                    }
                }
                else
                {
                    block(NO,nil,error);
                }
            }];
            //authenticated
            NSLog(@"Authenticated!!");
        }
        else
        {
            //NOT authenticated
            NSLog(@"Request Failed: %@",[error debugDescription]);
        }
    }];
    
}


@end
