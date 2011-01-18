//
//  AKServiceManager.h
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Resource Interactive. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AKDevice.h"

@class AKAirplayManager;

@protocol AKAirplayManagerDelegate <NSObject>

@optional
- (void) manager:(AKAirplayManager *)manager didFindDevice:(AKDevice *)device; // Use - (void) connectToDevice:(AKDevice *)device; to connect to a specific device.
- (void) manager:(AKAirplayManager *)manager didConnectToDevice:(AKDevice *)device; // Once connected, use AKDevice methods to communicate over Airplay.

@end


@interface AKAirplayManager : NSObject
{
@private
	id <AKAirplayManagerDelegate> delegate;
	BOOL autoConnect;
}

@property (nonatomic, assign) id <AKAirplayManagerDelegate> delegate;
@property (nonatomic) BOOL autoConnect; // Connects to the first found device automatically. Defaults to YES.

- (void) findDevices; // Searches for Airplay devices on the same wifi network.
- (void) connectToDevice:(AKDevice *)device; // Connects to a found device.

@end
