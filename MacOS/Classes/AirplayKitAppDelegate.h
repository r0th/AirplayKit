//
//  AirplayKitAppDelegate.h
//  AirplayKit
//
//  Created by Andy Roth on 1/18/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AKAirplayManager.h"

@interface AirplayKitAppDelegate : NSObject <NSApplicationDelegate, AKAirplayManagerDelegate>
{
    NSWindow *window;
	IBOutlet NSTextField *label;
	
	AKAirplayManager *manager;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction) sendRemoteVideo:(id)sender;
- (IBAction) droppedImage:(id)sender;

@end
