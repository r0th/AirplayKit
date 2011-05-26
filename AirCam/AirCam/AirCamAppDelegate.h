//
//  AirCamAppDelegate.h
//  AirCam
//
//  Created by Andy Roth on 5/26/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AirCamViewController;

@interface AirCamAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AirCamViewController *viewController;

@end
