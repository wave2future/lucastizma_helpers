//
//  NSArray+LTAdditions.m
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

#import "NSArray+LTAdditions.h"

@implementation NSArray ( LTAdditions )

#pragma mark -
#pragma mark NSArray ( LTAdditions ) Category Methods

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