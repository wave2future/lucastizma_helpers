//
//  STViewController.m
//
//  Created by Michael Potter on 6/7/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "STViewController.h"
#import "NSString+STAddition.h"
#import <objc/message.h>

@implementation STViewController

#pragma mark -
#pragma mark STViewController Methods

- ( void )dismissKeyboard
{
	// Property collection logic taken mostly from ObjectiveResource's NSObject+Properties.m class: http://www.iphoneonrails.com/
	
	Class currentClass = [ self class ];
	NSMutableArray * propertyNames = [ NSMutableArray array ];
		
	while ( currentClass != nil )
	{
		NSUInteger numberOfProperties;
		objc_property_t * propertyList = class_copyPropertyList( currentClass, ( & numberOfProperties ) );

		NSInteger i;
		
		for ( i = 0; i < numberOfProperties; i++ )
		{
			objc_property_t * property = propertyList + i;
			NSString * propertyName = [ NSString stringWithCString:property_getName( * property ) encoding:NSUTF8StringEncoding ];
			
			if ( [ propertyName isNotEqualToString:@"_mapkit_hasPanoramaID" ] && [ propertyName isNotEqualToString:@"URLValue" ] )
			{
				[ propertyNames addObject:propertyName ];
			}
		}
	
		free( propertyList );
		currentClass = [ currentClass superclass ];
	}

	NSDictionary * properties = [ self dictionaryWithValuesForKeys:propertyNames ];
	
	for ( id key in properties )
	{
		id property = [ properties objectForKey:key ];
		
		if ( [ property respondsToSelector:@selector( isFirstResponder ) ] )
		{
			if ( [ ( UIResponder * )property isFirstResponder ] )
			{
				[ ( UIResponder * )property resignFirstResponder ];
			}
		}
	}
}

@end