//
//  DKToast.h
//  DevKit
//
//  Created by Andy Roth on 11/19/10.
//  Copyright 2010 Roozy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum DKToastDuration
{
	DKToastDurationLong,
	DKToastDurationShort
} DKToastDuration;

@interface DKToast : NSObject
{

}

+ (void) showToast:(NSString *)content duration:(DKToastDuration)duration;

@end
