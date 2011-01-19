//
//  AirplayKitAppDelegate.m
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Resource Interactive. All rights reserved.
//

#import "AirplayKitAppDelegate.h"

@implementation AirplayKitAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Just Testing
	AKAirplayManager *manager = [[AKAirplayManager alloc] init];
	manager.delegate = self;
	[manager findDevices];
}

- (void) manager:(AKAirplayManager *)manager didFindDevice:(AKDevice *)device
{
	NSLog(@"DELEGATE: Device Found");
}

- (void) manager:(AKAirplayManager *)manager didConnectToDevice:(AKDevice *)device
{
	NSLog(@"DELEGATE: Connected");
	
	// Send a content URL
	[device sendContentURL:@"http://roozy.net/deadman.mp4"];
}

@end
