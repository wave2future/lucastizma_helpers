//
//  CATransition+STAdditions.m
//  SpotTrot
//
//  Created by Michael Potter on 6/6/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "CATransition+STAdditions.h"
#import "STGlobalReferences.h"

@implementation CATransition ( STAdditions )

#pragma mark -
#pragma mark CATransition ( STAdditions ) Category Methods

// animationWithType:subtype:duration:timingFunctionName:onLayer:
// 
// This convenience method creates a CATransition animation all in one call by wrapping up the "type", "subtype", "duration", and "timingFunction"
// properties and adding the animation to the CALayer passed in via the "layer" parameter.

+ ( void )animationWithType:( NSString * )type subtype:( NSString * )subtype duration:( CFTimeInterval )duration
		 timingFunctionName:( NSString * )timingFunctionName onLayer:( CALayer * )layer
{
	CATransition * animation = [ CATransition animation ];
	animation.type = type;
	animation.subtype = subtype;
	animation.duration = duration;
	animation.timingFunction = [ CAMediaTimingFunction functionWithName:timingFunctionName ];
	
	[ layer addAnimation:animation forKey:nil ];
}

+ ( void )standardFadeAnimationOnLayer:( CALayer * )layer
{
	[ CATransition animationWithType:kCATransitionFade subtype:nil duration:STAnimationTimeIntervalDefault
				  timingFunctionName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

@end