//
//  AKServiceManager.m
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Resource Interactive. All rights reserved.
//

#import "AKAirplayManager.h"


@implementation AKAirplayManager

@synthesize delegate, autoConnect;

#pragma mark -
#pragma mark Initialization

- (id) init
{
	if(self = [super init])
	{
		self.autoConnect = YES;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods
- (void) findDevices
{
	
}

- (void) connectToDevice:(AKDevice *)device
{
	
}

@end
