//
//  UIActionSheet+STAdditions.m
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