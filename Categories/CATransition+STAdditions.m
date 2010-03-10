//
//  CATransition+LTAdditions.m
//
//  Copyright 2010 Michael Shannon Potter
// 
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
// 
//      http://www.apache.org/licenses/LICENSE-2.0
// 
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "CATransition+LTAdditions.h"

@implementation CATransition ( LTAdditions )

#pragma mark -
#pragma mark CATransition ( LTAdditions ) Category Methods

// animationWithType:subtype:duration:timingFunctionWithName:onLayer:
// 
// This convenience method creates a CATransition animation all in one call by wrapping up the "type", "subtype", "duration", and "timingFunction"
// properties and adding the animation to the CALayer passed in via the "layer" parameter.

+ ( void )animationWithType:( NSString * )type subtype:( NSString * )subtype duration:( CFTimeInterval )duration
	 timingFunctionWithName:( NSString * )timingFunctionName onLayer:( CALayer * )layer
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
			  timingFunctionWithName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

+ ( void )standardMoveInAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer
{
	[ CATransition animationWithType:kCATransitionMoveIn subtype:subtype duration:0.2
			  timingFunctionWithName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

+ ( void )standardPushAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer
{
	[ CATransition animationWithType:kCATransitionPush subtype:subtype duration:0.2
			  timingFunctionWithName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

+ ( void )standardRevealAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer
{
	[ CATransition animationWithType:kCATransitionReveal subtype:subtype duration:0.2
			  timingFunctionWithName:kCAMediaTimingFunctionEaseInEaseOut onLayer:layer ];
}

@end