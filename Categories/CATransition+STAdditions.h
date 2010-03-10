//
//  CATransition+LTAdditions.h
//
//  Copyright 2010 Michael Shannon Potter
//
//  LucasTizma
//  www.lucastizma.com
//  lucastizma@lucastizma.com (E-mail/AIM)
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

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CATransition ( LTAdditions )

+ ( void )animationWithType:( NSString * )type subtype:( NSString * )subtype duration:( CFTimeInterval )duration
	 timingFunctionWithName:( NSString * )timingFunctionName onLayer:( CALayer * )layer;
+ ( void )standardFadeAnimationOnLayer:( CALayer * )layer;
+ ( void )standardMoveInAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer;
+ ( void )standardPushAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer;
+ ( void )standardRevealAnimationWithSubtype:( NSString * )subtype onLayer:( CALayer * )layer;

@end