//
//  LTViewController.m
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

#import "LTViewController.h"
#import "NSString+LTAddition.h"
#import <objc/message.h>

@implementation LTViewController

#pragma mark -
#pragma mark LTViewController Methods

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