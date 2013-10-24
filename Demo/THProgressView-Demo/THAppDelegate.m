//
//  THAppDelegate.m
//  THProgressView-Demo
//
//  Created by Tiago Henriques on 10/22/13.
//  Copyright (c) 2013 Tiago Henriques. All rights reserved.
//

#import "THAppDelegate.h"
#import "THViewController.h"

@implementation THAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [THViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
