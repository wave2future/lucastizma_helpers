//
//  NSArray+STAdditions.m
//
//  Created by Michael Potter on 9/26/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "NSArray+STAdditions.h"

@implementation NSArray ( STAdditions )

#pragma mark -
#pragma mark NSArray ( STAdditions ) Category Methods

- ( NSArray * )sortedArrayWithDescriptorKey:( NSString * )key ascending:( BOOL )ascending
{
	return [ self sortedArrayWithDescriptorKeys:[ NSArray arrayWithObject:key ] ascending:ascending ];
}

- ( NSArray * )sortedArrayWithDescriptorKeys:( NSArray * )keys ascending:( BOOL )ascending
{
	NSArray * arrayToBeSorted = [ NSArray arrayWithArray:self ];
	NSMutableArray * sortDescriptors = [ NSMutableArray arrayWithCapacity:[ keys count ] ];
	
	for ( NSString * key in keys )
	{
		[ sortDescriptors addObject:[ [ [ NSSortDescriptor alloc ] initWithKey:key ascending:ascending ] autorelease ] ];
	}
	
	NSArray * sortedArray = [ arrayToBeSorted sortedArrayUsingDescriptors:sortDescriptors ];
	
	return sortedArray;
}

@end