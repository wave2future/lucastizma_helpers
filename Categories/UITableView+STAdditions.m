//
//  UITableView+STAdditions.m
//
//  Created by Michael Potter on 6/30/09.
//  Copyright 2009 INM United. All rights reserved.
//
 
#import "UITableView+STAdditions.h"
 
@implementation UITableView ( STAdditions )
 
#pragma mark -
#pragma mark UITableView ( STAdditions ) Category Methods
 
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