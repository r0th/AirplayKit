//
//  AirCamViewController.h
//  AirCam
//
//  Created by Andy Roth on 5/26/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKAirplayManager.h"
#import "AKDevice.h"

@interface AirCamViewController : UIViewController <AKAirplayManagerDelegate, AKDeviceDelegate>
{
    AKAirplayManager *manager;
	NSTimer *runTimer;
}

- (void) stop;

@end
