//
//  SDZAppDelegate.m
//  AppStatusChecker
//
//  Created by zhangqian on 09/14/2023.
//  Copyright (c) 2023 zhangqian. All rights reserved.
//

#import "SDZAppDelegate.h"

#import <SDZAppStatusCheckTool.h>

@implementation SDZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [SDZAppStatusCheckTool checkWithType:SDZAppOnlineStatusCheckToolTypeOnline para:@{@"ID": @"6446027093"} completionHandler:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
            if (!error && data[@"resultCount"]) {
                bool online = [data[@"resultCount"] boolValue];
                if (online) {
                    NSLog(@"在线");
                }else {
                    NSLog(@"下线");
                }
            }
    }];
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
