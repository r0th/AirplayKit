//
//  AirCamViewController.m
//  AirCam
//
//  Created by Andy Roth on 5/26/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import "AirCamViewController.h"
#import "CameraImageHelper.h"
#import "DKToast.h"

@implementation AirCamViewController

- (void) viewDidLoad
{
	// Start the camera preview
	[CameraImageHelper startRunning];
	self.view = [CameraImageHelper previewWithBounds:self.view.bounds];
	
	// Listen for Airplay devices
	manager = [[AKAirplayManager alloc] init];
	manager.delegate = self;
	[manager findDevices];
}

#pragma mark -
#pragma mark Airplay Delegate

- (void) manager:(AKAirplayManager *)aManager didConnectToDevice:(AKDevice *)device
{
	[DKToast showToast:@"Connected. Sending camera over Airplay." duration:DKToastDurationLong];
	
	manager.connectedDevice.imageQuality = 0.20f;
	
	// Start a timer to send the images
	runTimer = [[NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(sendImage) userInfo:nil repeats:YES] retain];
}

#pragma mark -
#pragma mark Timer

- (void) sendImage
{
	[manager.connectedDevice sendImage:[CameraImageHelper image]];
}

#pragma mark - Cleanup

- (void) dealloc
{
	[manager release];
	[CameraImageHelper stopRunning];
	[super dealloc];
}

@end
