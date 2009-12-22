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