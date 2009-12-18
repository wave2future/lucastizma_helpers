//
//  NSBundle+STAdditions.m
//
//  Created by Michael Potter on 6/13/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "NSBundle+STAdditions.h"

@implementation NSBundle ( STAdditions )

#pragma mark -
#pragma mark NSBundle ( STAdditions ) Category Methods

- ( BOOL )resourceExistsWithFileName:( NSString * )fileName
{
	BOOL resourceExists = NO;
	
	NSString * fileNameExtension = [ fileName pathExtension ];
    NSString * fileNameWithoutExtension = [ fileName stringByDeletingPathExtension ];
	
	if ( [ [ NSBundle mainBundle ] pathForResource:fileNameWithoutExtension ofType:fileNameExtension ] != nil ) 
	{
		resourceExists = YES;
	}
	
	return resourceExists;
}

@end