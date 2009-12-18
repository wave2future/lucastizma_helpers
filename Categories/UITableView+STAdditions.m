//
//  UITableView+STAdditions.m
//  SpotTrot
//
//  Created by Michael Potter on 6/30/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "UITableView+STAdditions.h"
#import "STGlobalReferences.h"

@implementation UITableView ( STAdditions )

#pragma mark -
#pragma mark UITableView ( STAdditions ) Category Methods

+ ( UITableViewCell * )createReferenceCellWithNibName:( NSString * )nibName
{
	NSArray * nib = [ [ NSBundle mainBundle ] loadNibNamed:nibName owner:self options:nil ];
	UITableViewCell * cell = [ nib objectAtIndex:0 ];
	
	return cell;
}

+ ( UITableViewCell * )createReferenceCellWithClass:( Class )class
{
	NSString * className = NSStringFromClass( class );
	
	return [ UITableView createReferenceCellWithNibName:className ];
}

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

- ( UITableViewCell * )dequeueReusableCellWithIdentifier:( NSString * )identifier nibName:( NSString * )nibName referenceCell:( UITableViewCell * )referenceCell
{	
	UITableViewCell * cell = [ self dequeueReusableCellWithIdentifier:identifier ];
	
	if ( cell == nil )
	{
		if ( referenceCell != nil )
		{
			cell = [ [ [ referenceCell class ] alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier referenceCell:referenceCell ];
		}
		else
		{
			cell = [ self createNewCellWithNibName:nibName ];
		}
	}
	
	return cell;
}

- ( UITableViewCell * )dequeueReusableCellWithClass:( Class )class referenceCell:( UITableViewCell * )referenceCell
{	
	NSString * className = NSStringFromClass( class );
	
	return [ self dequeueReusableCellWithIdentifier:[ NSString stringWithFormat:STTableViewCellIdentifierFormat, className ] nibName:className
										 referenceCell:referenceCell ];
}

@end