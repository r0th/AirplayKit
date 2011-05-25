//
//  UIApplication+AirPresent.m
//  AirPresent
//
//  Created by Andy Roth on 1/22/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import "UIApplication+AirPresent.h"
#import <QuartzCore/QuartzCore.h>
#import "AKAirplayManager.h"

@interface APManager : NSObject <AKAirplayManagerDelegate>
{
	AKAirplayManager *airplay;
	NSTimer *runTimer;
}

+ (APManager *) sharedManager;

- (void) start;
- (void) stop;

@end

@implementation UIApplication (AirPresent)

- (void) beginPresentingScreen
{
	[[APManager sharedManager] start];
}

- (void) endPresentingScreen
{
	[[APManager sharedManager] stop];
}

@end

@implementation UIView (AirPresent)

- (UIImage *) viewAsImage
{
	UIGraphicsBeginImageContext(self.bounds.size);
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return viewImage;
}

@end

#pragma mark -
#pragma mark APManager

@implementation APManager

static APManager *instance;

#pragma mark -
#pragma mark Singleton

+ (APManager *) sharedManager
{
	if(!instance)
	{
		instance = [[APManager alloc] init];
	}
	
	return instance;
}

#pragma mark -
#pragma mark Public Methods

- (void) start
{
	if(!airplay)
	{
		airplay = [[AKAirplayManager alloc] init];
		airplay.delegate = self;
	}
	
	if(!airplay.connectedDevice)
	{
		[airplay findDevices];
	}
	else
	{
		[self manager:airplay didConnectToDevice:airplay.connectedDevice];
	}
}

- (void) stop
{
	[airplay.connectedDevice sendStop];
	
	if(runTimer)
	{
		[runTimer invalidate];
		[runTimer release];
		runTimer = nil;
	}
}

#pragma mark -
#pragma mark Airplay Delegate

- (void) manager:(AKAirplayManager *)manager didConnectToDevice:(AKDevice *)device
{
	// Start a timer to send the images
	runTimer = [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(sendScreen) userInfo:nil repeats:YES] retain];
}

#pragma mark -
#pragma mark Timer

- (void) sendScreen
{
	UIWindow *window = [UIApplication sharedApplication].keyWindow;
	if(!window) window = [[UIApplication sharedApplication].windows objectAtIndex:0];
	
	UIImage *image = [window viewAsImage];
	[airplay.connectedDevice sendImage:image];
}

@end
