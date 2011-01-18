//
//  AKDevice.m
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Resource Interactive. All rights reserved.
//

#import "AKDevice.h"


@implementation AKDevice

@synthesize hostname, port;

- (void) dealloc
{
	[hostname release];
	[super dealloc];
}

@end
