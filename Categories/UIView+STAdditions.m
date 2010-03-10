//
//  UIView+LTAdditions.m
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

#import "UIView+LTAdditions.h"

@implementation UIView ( LTAdditions )

#pragma mark -
#pragma mark UIView ( LTAdditions ) Category Methods

- ( void )setFrameX:( CGFloat )x
{
	self.frame = CGRectMake( x, self.frame.origin.y, self.frame.size.width, self.frame.size.height );
}

- ( void )setFrameY:( CGFloat )y
{
	self.frame = CGRectMake( self.frame.origin.x, y, self.frame.size.width, self.frame.size.height );
}

- ( void )setFrameWidth:( CGFloat )width
{
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height );
}

- ( void )setFrameHeight:( CGFloat )height
{
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height );
}

- ( void )shiftFrameX:( CGFloat )x
{
	self.frame = CGRectMake( ( self.frame.origin.x + x ), self.frame.origin.y, self.frame.size.width, self.frame.size.height );
}

- ( void )shiftFrameY:( CGFloat )y
{
	self.frame = CGRectMake( self.frame.origin.x, ( self.frame.origin.y + y ), self.frame.size.width, self.frame.size.height );
}

- ( void )shiftFrameWidth:( CGFloat )width
{
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, ( self.frame.size.width + width ), self.frame.size.height );
}

- ( void )shiftFrameHeight:( CGFloat )height
{
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, self.frame.size.width, ( self.frame.size.height + height ) );
}

- ( void )setFrameX:( CGFloat )x animatedForDuration:( NSTimeInterval )duration
{
	[ UIView beginAnimations ];
	[ UIView setAnimationDuration:duration ];
	
	self.frame = CGRectMake( x, self.frame.origin.y, self.frame.size.width, self.frame.size.height );

	[ UIView commitAnimations ];
}

- ( void )setFrameY:( CGFloat )y animatedForDuration:( NSTimeInterval )duration
{
	[ UIView beginAnimations ];
	[ UIView setAnimationDuration:duration ];
	
	self.frame = CGRectMake( self.frame.origin.x, y, self.frame.size.width, self.frame.size.height );

	[ UIView commitAnimations ];
}

- ( void )setFrameWidth:( CGFloat )width animatedForDuration:( NSTimeInterval )duration
{
	[ UIView beginAnimations ];
	[ UIView setAnimationDuration:duration ];
	
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height );
	
	[ UIView commitAnimations ];
}

- ( void )setFrameHeight:( CGFloat )height animatedForDuration:( NSTimeInterval )duration
{
	[ UIView beginAnimations ];
	[ UIView setAnimationDuration:duration ];
	
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height );
	
	[ UIView commitAnimations ];
}

- ( void )shiftFrameX:( CGFloat )x animatedForDuration:( NSTimeInterval )duration
{
	[ UIView beginAnimations ];
	[ UIView setAnimationDuration:duration ];
	
	self.frame = CGRectMake( ( self.frame.origin.x + x ), self.frame.origin.y, self.frame.size.width, self.frame.size.height );
	
	[ UIView commitAnimations ];
}

- ( void )shiftFrameY:( CGFloat )y animatedForDuration:( NSTimeInterval )duration
{
	[ UIView beginAnimations ];
	[ UIView setAnimationDuration:duration ];
	
	self.frame = CGRectMake( self.frame.origin.x, ( self.frame.origin.y + y ), self.frame.size.width, self.frame.size.height );
	
	[ UIView commitAnimations ];
}

- ( void )shiftFrameWidth:( CGFloat )width animatedForDuration:( NSTimeInterval )duration
{
	[ UIView beginAnimations ];
	[ UIView setAnimationDuration:duration ];
	
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, ( self.frame.size.width + width ), self.frame.size.height );
	
	[ UIView commitAnimations ];
}

- ( void )shiftFrameHeight:( CGFloat )height animatedForDuration:( NSTimeInterval )duration
{
	[ UIView beginAnimations ];
	[ UIView setAnimationDuration:duration ];
	
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, self.frame.size.width, ( self.frame.size.height + height ) );
	
	[ UIView commitAnimations ];
}

+ ( void )beginAnimations
{
	[ UIView beginAnimations:nil context:NULL ];
}

@end