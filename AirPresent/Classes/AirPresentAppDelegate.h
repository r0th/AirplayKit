//
//  AirPresentAppDelegate.h
//  AirPresent
//
//  Created by Andy Roth on 1/22/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AirPresentViewController;

@interface AirPresentAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    AirPresentViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AirPresentViewController *viewController;

@end

