//
//  NSString+STAdditions.m
//
//  Created by Michael Potter on 6/6/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "NSString+STAdditions.h"

@implementation NSString ( STAdditions )

#pragma mark -
#pragma mark NSString ( STAdditions ) Category Methods

// dashedString
// 
// This method replaces all spaces in a string with dashes (-) and lowercases any uppercase characters.

- ( NSString * )dashedString
{
	NSString * dasherizedString = [ [ self lowercaseString ] stringByReplacingOccurrencesOfString:@" " withString:@"-" ];
	
	return dasherizedString;
}

// isNotEqualToString:
//
// This method is the inverse of the standard NSString method "isEqualToString:".

- ( BOOL )isNotEqualToString:( NSString * )string
{
	return ( ! [ self isEqualToString:string ] );
}

- ( BOOL )isEmpty
{
	BOOL empty = NO;

	if ( [ self isEqualToString:@"" ] || [ self isEqualToString:@"<null>" ] || [ self isEqualToString:@"(null)" ] )
	{
		empty = YES;
	}
	
	return empty;
}

- ( BOOL )isNotEmpty
{
	return ( ! [ self isEmpty ] );
}

@end