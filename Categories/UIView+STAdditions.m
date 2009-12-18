//
//  UIView+STAdditions.m
//
//  Created by Michael Potter on 8/18/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "UIView+STAdditions.h"

@implementation UIView ( STAdditions )

#pragma mark -
#pragma mark UIView ( STAdditions ) Category Methods

// setFrameX:animted:duration:
//
// This method "changes" this view's frame's x coordinate to the value of the "x" parameter by creating a new CGRect with all other CGRectMake() 
// function parameters being the same as the current frame. Animation is optionally applied.

- ( void )setFrameX:( CGFloat )x animated:( BOOL )animated  duration:( NSTimeInterval )duration
{
	if ( animated )
	{
		[ UIView beginAnimations ];
		[ UIView setAnimationDuration:duration ];
	}
	
	self.frame = CGRectMake( x, self.frame.origin.y, self.frame.size.width, self.frame.size.height );
	
	if ( animated )
	{
		[ UIView commitAnimations ];
	}
}

// setFrameY:animted:duration:
//
// This method "changes" this view's frame's y coordinate to the value of the "y" parameter by creating a new CGRect with all other CGRectMake() 
// function parameters being the same as the current frame. Animation is optionally applied.

- ( void )setFrameY:( CGFloat )y animated:( BOOL )animated  duration:( NSTimeInterval )duration
{
	if ( animated )
	{
		[ UIView beginAnimations ];
		[ UIView setAnimationDuration:duration ];
	}
	
	self.frame = CGRectMake( self.frame.origin.x, y, self.frame.size.width, self.frame.size.height );
	
	if ( animated )
	{
		[ UIView commitAnimations ];
	}
}

// setFrameWidth:animted:duration:
//
// This method "changes" this view's frame's width to the value of the "width" parameter by creating a new CGRect with all other CGRectMake() 
// function parameters being the same as the current frame. Animation is optionally applied.

- ( void )setFrameWidth:( CGFloat )width animated:( BOOL )animated  duration:( NSTimeInterval )duration
{
	if ( animated )
	{
		[ UIView beginAnimations ];
		[ UIView setAnimationDuration:duration ];
	}
	
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height );
	
	if ( animated )
	{
		[ UIView commitAnimations ];
	}
}

// setFrameHeight:animted:duration:
//
// This method "changes" this view's frame's height to the value of the "height" parameter by creating a new CGRect with all other CGRectMake() 
// function parameters being the same as the current frame. Animation is optionally applied.

- ( void )setFrameHeight:( CGFloat )height animated:( BOOL )animated  duration:( NSTimeInterval )duration
{
	if ( animated )
	{
		[ UIView beginAnimations ];
		[ UIView setAnimationDuration:duration ];
	}
	
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height );
	
	if ( animated )
	{
		[ UIView commitAnimations ];
	}
}

// shiftFrameX:animted:duration:
//
// This method "shift" this view's frame's x coordinate by the value of the "x" parameter by creating a new CGRect with all other CGRectMake() 
// function parameters being the same as the current frame. Animation is optionally applied.

- ( void )shiftFrameX:( CGFloat )x animated:( BOOL )animated  duration:( NSTimeInterval )duration
{
	if ( animated )
	{
		[ UIView beginAnimations ];
		[ UIView setAnimationDuration:duration ];
	}
	
	self.frame = CGRectMake( ( self.frame.origin.x + x ), self.frame.origin.y, self.frame.size.width, self.frame.size.height );
	
	if ( animated )
	{
		[ UIView commitAnimations ];
	}
}

// shiftFrameY:animted:duration:
//
// This method "shift" this view's frame's y coordinate by the value of the "y" parameter by creating a new CGRect with all other CGRectMake() 
// function parameters being the same as the current frame. Animation is optionally applied.

- ( void )shiftFrameY:( CGFloat )y animated:( BOOL )animated  duration:( NSTimeInterval )duration
{
	if ( animated )
	{
		[ UIView beginAnimations ];
		[ UIView setAnimationDuration:duration ];
	}
	
	self.frame = CGRectMake( self.frame.origin.x, ( self.frame.origin.y + y ), self.frame.size.width, self.frame.size.height );
	
	if ( animated )
	{
		[ UIView commitAnimations ];
	}
}

// shiftFrameWidth:animted:duration:
//
// This method "shift" this view's frame's width by the value of the "width" parameter by creating a new CGRect with all other CGRectMake() 
// function parameters being the same as the current frame. Animation is optionally applied.

- ( void )shiftFrameWidth:( CGFloat )width animated:( BOOL )animated  duration:( NSTimeInterval )duration
{
	if ( animated )
	{
		[ UIView beginAnimations ];
		[ UIView setAnimationDuration:duration ];
	}
	
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, ( self.frame.size.width + width ), self.frame.size.height );
	
	if ( animated )
	{
		[ UIView commitAnimations ];
	}
}

// shiftFrameHeight:animted:duration:
//
// This method "shift" this view's frame's height by the value of the "height" parameter by creating a new CGRect with all other CGRectMake() 
// function parameters being the same as the current frame. Animation is optionally applied.

		 - ( void )shiftFrameHeight:( CGFloat )height animated:( BOOL )animated  duration:( NSTimeInterval )duration
{
	if ( animated )
	{
		[ UIView beginAnimations ];
		[ UIView setAnimationDuration:duration ];
	}
	
	self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y, self.frame.size.width, ( self.frame.size.height + height ) );
	
	if ( animated )
	{
		[ UIView commitAnimations ];
	}
}

// beginAnimations
//
// This method merely calls beginAnimations:context: with nil and NULL parameters, respectively.

+ ( void )beginAnimations
{
	[ UIView beginAnimations:nil context:NULL ];
}

@end