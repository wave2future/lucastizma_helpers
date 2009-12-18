//
//  CATransition+STAdditions.h
//  SpotTrot
//
//  Created by Michael Potter on 6/6/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CATransition ( STAdditions )

+ ( void )animationWithType:( NSString * )type subtype:( NSString * )subtype duration:( CFTimeInterval )duration
		 timingFunctionName:( NSString * )timingFunctionName onLayer:( CALayer * )layer;
+ ( void )standardFadeAnimationOnLayer:( CALayer * )layer;

@end