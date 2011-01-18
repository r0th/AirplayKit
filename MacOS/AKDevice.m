//
//  AKDevice.m
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Resource Interactive. All rights reserved.
//

#import "AKDevice.h"


@implementation AKDevice

@synthesize hostname, port, delegate, connected;

#pragma mark -
#pragma mark Initialization

- (id) init
{
	if(self = [super init])
	{
		connected = NO;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (void) sendRawMessage:(NSString *)message
{
	
}

#pragma mark -
#pragma mark Cleanup

- (void) dealloc
{
	[hostname release];
	[super dealloc];
}

@end