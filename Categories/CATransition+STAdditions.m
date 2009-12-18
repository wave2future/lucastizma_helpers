//
//  CATransition+STAdditions.m
//
//  Created by Michael Potter on 6/6/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "CATransition+STAdditions.h"

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
	[ CATransition animationWithType:kCATransitionFade subtype:nil duration:0.2
				  timingFunctionName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

+ ( void )standardMoveInAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer
{
	[ CATransition animationWithType:kCATransitionMoveIn subtype:subtype duration:0.2
				  timingFunctionName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

+ ( void )standardPushAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer
{
	[ CATransition animationWithType:kCATransitionPush subtype:subtype duration:0.2
				  timingFunctionName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

+ ( void )standardRevealAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer
{
	[ CATransition animationWithType:kCATransitionReveal subtype:subtype duration:0.2
				  timingFunctionName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

@end