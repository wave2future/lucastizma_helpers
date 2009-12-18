//
//  UIActionSheet+STAdditions.m
//
//  Created by Michael Potter on 8/20/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "UIActionSheet+STAdditions.h"

@implementation UIActionSheet ( STAdditions )

#pragma mark -
#pragma mark UIActionSheet ( STAdditions ) Category Methods

+ ( void )showYesNoActionSheetWithTitle:( NSString * )title delegate:( id )delegate
{
	UIActionSheet * actionSheet = [ [ [ UIActionSheet alloc ] initWithTitle:title
																   delegate:delegate
														  cancelButtonTitle:@"No"
													 destructiveButtonTitle:@"Yes"
														  otherButtonTitles:nil ] autorelease ];
	
	actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
	
	[ actionSheet showInView:[ [ UIApplication sharedApplication ] keyWindow ] ];
}

@end