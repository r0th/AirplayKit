//
//  UIApplication+AirPresent.h
//  AirPresent
//
//  Created by Andy Roth on 1/22/11.
//  Copyright 2011 Roozy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIApplication (AirPresent)

- (void) beginPresentingScreen;
- (void) endPresentingScreen;

@end

@interface UIView (AirPresent)

- (UIImage *) viewAsImage;

@end
