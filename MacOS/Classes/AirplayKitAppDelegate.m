//
//  AirplayKitAppDelegate.m
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import "AirplayKitAppDelegate.h"

@implementation AirplayKitAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Just Testing
	manager = [[AKAirplayManager alloc] init];
	manager.delegate = self;
	[manager findDevices];
}

- (void) manager:(AKAirplayManager *)manager didFindDevice:(AKDevice *)device
{
	[label setStringValue:@"Found device. Connecting..."];
}

- (void) manager:(AKAirplayManager *)manager didConnectToDevice:(AKDevice *)device
{
	[label setStringValue:[NSString stringWithFormat:@"Connected to device : %@", device.hostname]];
}

- (IBAction) sendRemoteVideo:(id)sender
{
	if(manager.connectedDevice) [manager.connectedDevice sendContentURL:@"http://roozy.net/deadman.mp4"];
}

- (IBAction) droppedImage:(id)sender
{
	NSImageCell *cell = (NSImageCell *)sender;
	NSImage *image = [cell image];
	
	if(manager.connectedDevice) [manager.connectedDevice sendImage:image];
}

@end
