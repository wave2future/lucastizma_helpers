//
//  UIAlertView+STAdditions.m
//
//  Created by Michael Potter on 8/17/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "UIAlertView+STAdditions.h"

@implementation UIAlertView ( STAdditions )

#pragma mark -
#pragma mark UIAlertView ( STAdditions ) Category Methods

+ ( void )showStandardAlertViewWithTitle:( NSString * )title message:( NSString * )message
{
	[ UIAlertView showStandardAlertViewWithTitle:title message:message delegate:nil ];
}

+ ( void )showStandardAlertViewWithTitle:( NSString * )title message:( NSString * )message delegate:( id )delegate
{
	UIAlertView * alertView = [ [ [ UIAlertView alloc ] initWithTitle:title
															  message:message
															 delegate:delegate
													cancelButtonTitle:@"OK"
													otherButtonTitles:nil ] autorelease ];
	
	[ alertView show ];
}

@end