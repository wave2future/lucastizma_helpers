//
//  NSString+STAdditions.m
//  SpotTrot
//
//  Created by Michael Potter on 6/6/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "NSString+STAdditions.h"
#import "STGlobalReferences.h"

@implementation NSString ( STAdditions )

#pragma mark -
#pragma mark NSString ( STAdditions ) Category Methods

// dasherizeString
// 
// This method replaces all spaces in a string with dashes (-) and lowercases any uppercase characters.

- ( NSString * )dashedString
{
	NSString * dasherizedString = [ [ self lowercaseString ] stringByReplacingOccurrencesOfString:@" " withString:@"-" ];
	
	return dasherizedString;
}

// absolutePath
//
// This method converts, if necessary, "self" to an absolute path reference.

- ( NSString * )absolutePath
{
	NSString * absolutePath;
	
	if ( [ [ self substringToIndex:1 ] isEqualToString:@"/" ] )
	{
		absolutePath = [ NSString stringWithFormat:@"%@%@", [ ObjectiveResourceConfig getRemoteSite ], [ self substringFromIndex:1 ] ];
	}
	else
	{
		absolutePath = self;
	}

	return absolutePath;
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