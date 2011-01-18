//
//  AKDevice.h
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Resource Interactive. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AKDevice : NSObject
{
	NSString *hostname;
	UInt16 port;
}

@property (nonatomic, retain) NSString *hostname;
@property (nonatomic) UInt16 port;

@end
