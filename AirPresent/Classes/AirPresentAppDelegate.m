//
//  AirPresentAppDelegate.m
//  AirPresent
//
//  Created by Andy Roth on 1/22/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import "AirPresentAppDelegate.h"
#import "AirPresentViewController.h"
#import "UIApplication+AirPresent.h"

@implementation AirPresentAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    [[UIApplication sharedApplication] beginPresentingScreen];

    // Add the view controller's view to the window and display.
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    [[UIApplication sharedApplication] endPresentingScreen];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	//[[UIApplication sharedApplication] endPresentingScreen];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    //[[UIApplication sharedApplication] beginPresentingScreen];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[UIApplication sharedApplication] beginPresentingScreen];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [[UIApplication sharedApplication] endPresentingScreen];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
