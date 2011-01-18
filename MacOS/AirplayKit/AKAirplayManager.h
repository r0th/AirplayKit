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

@protocol AKAirplayManagerDelegate

- (void) manager:(AKAirplayManager *)manager didFindDevices:(NSArray *)devices;
- (void) manager:(AKAirplayManager *)manager didConnectToDevice:(AKDevice *)device;

@end


@interface AKAirplayManager : NSObject
{
	id <AKAirplayManagerDelegate> delegate;
}

@property (nonatomic, assign) id <AKAirplayManagerDelegate> delegate;

- (void) findDevices;
- (void) connectToDevice:(AKDevice *)device;

@end
