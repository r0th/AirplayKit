//
//  AKDevice.h
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Resource Interactive. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class AKDevice;

@protocol AKDeviceDelegate <NSObject>

- (void) device:(AKDevice *)device didSendBackMessage:(NSString *)message;

@end


@interface AKDevice : NSObject
{
@private
	NSString *hostname;
	UInt16 port;
	id <AKDeviceDelegate> delegate;
	BOOL connected;
}

@property (nonatomic, retain) NSString *hostname;
@property (nonatomic) UInt16 port;
@property (nonatomic, assign) id <AKDeviceDelegate> delegate;
@property (nonatomic) BOOL connected; // Set to YES when the device is connected.

- (void) sendRawMessage:(NSString *)message; // Sends a raw HTTP string over Airplay.

@end
