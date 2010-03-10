//
//  UITableView+LTAdditions.m
//
//  Copyright 2010 Michael Shannon Potter
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
 
#import "UITableView+LTAdditions.h"
 
@implementation UITableView ( LTAdditions )
 
#pragma mark -
#pragma mark UITableView ( LTAdditions ) Category Methods
 
- ( UITableViewCell * )createNewCellWithNibName:( NSString * )nibName
{
	NSArray * nib = [ [ NSBundle mainBundle ] loadNibNamed:nibName owner:self options:nil ];
	UITableViewCell * cell = [ nib objectAtIndex:0 ];
 
	return cell;
}
 
- ( UITableViewCell * )createNewCellWithClass:( Class )class
{
	NSString * className = NSStringFromClass( class );
 
	return [ self createNewCellWithNibName:className ];
}
 
- ( UITableViewCell * )dequeueReusableCellWithIdentifier:( NSString * )identifier nibName:( NSString * )nibName;
{	
	UITableViewCell * cell = [ self dequeueReusableCellWithIdentifier:identifier ];
 
	if ( cell == nil )
	{
		cell = [ self createNewCellWithNibName:nibName ];
	}
 
	return cell;
}
 
- ( UITableViewCell * )dequeueReusableCellWithClass:( Class )class
{	
	NSString * className = NSStringFromClass( class );
 
	return [ self dequeueReusableCellWithIdentifier:[ NSString stringWithFormat:@"%@Identifier", className ] nibName:className ];
}
 
@end