//
//  AppDelegate.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "AppDelegate.h"
#import "Tweet.h"
#import "ProfileViewController.h"
#import "SearchViewController.h"
#import "TimelineViewController.h"
#import "RequestManager.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    
    //timeline controller
    TimelineViewController *timelineController = [[TimelineViewController alloc] init];
    UINavigationController *timelineNavController = [[UINavigationController alloc] initWithRootViewController:timelineController];
    timelineController.navigationItem.title = @"Timeline";
    timelineNavController.tabBarItem.title = @"Timeline";
    

    //profile controller
    ProfileViewController *profileController = [[ProfileViewController alloc] init];
    UINavigationController *profileNavController = [[UINavigationController alloc] initWithRootViewController:profileController];
    profileController.navigationItem.title = @"Profile";
    profileNavController.tabBarItem.title = @"Profile";
    
    //search controller
    SearchViewController *searchController = [[SearchViewController alloc] init];
    UINavigationController *searchNavController = [[UINavigationController alloc] initWithRootViewController:searchController];
    searchController.navigationItem.title = @"Search";


    
    [tabController setViewControllers:@[timelineNavController,searchNavController,profileNavController]];

    NSLog(@"TabItem : %@\nNav TabItem : %@",searchController.tabBarItem,searchNavController.tabBarItem);
    searchNavController.tabBarItem.title = @"Search";
    
    
//    [[RequestManager sharedManager] sendRequest];
    
    
    self.window.rootViewController = tabController;
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
