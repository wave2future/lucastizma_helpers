//
//  UITextField+LTAdditions.m
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

#import "UITextField+LTAdditions.h"

@implementation UITextField ( LTAdditions )

#pragma mark -
#pragma mark UITextField ( LTAdditions ) Category Methods

// setCaption:caption
//
// This method creates a caption -- internally defined as a UILabel which is set as the "leftView" property of a UITextField.

- ( void )setCaption:( NSString * )caption
{
	UILabel * captionLabel = [ [ [ UILabel alloc ] init ] autorelease ];
	UIFont * boldSystemFont = [ UIFont boldSystemFontOfSize:self.font.pointSize ];
	
	captionLabel.font = boldSystemFont;
	captionLabel.text = caption;
	[ captionLabel sizeToFit ];
	
	self.leftView = captionLabel;
	self.leftViewMode = UITextFieldViewModeAlways;
}

// padCaptions:firstCaption, ...
//
// This method finds the largest width of the frame from among every caption -- internally defined as a UILabel which is set as the "leftView"
// property of a UITextField -- of the UITextFields passed as parameters. Once the largest width is found, every caption's frame's width is set to
// this value. Doing this left-aligns all the editable portions (i.e., the portions not taken up by the "leftView" property) of a series of
// UITextFields.

+ ( void )padCaptions:( UITextField * )firstCaption, ...
{
	CGFloat largestWidth;
	
	UITextField * eachCaption;
	va_list argumentList;
	
	if ( firstCaption != nil )
	{
		largestWidth = ( ( UILabel * )( firstCaption.leftView ) ).frame.size.width;
		
		va_start( argumentList, firstCaption );
		
		while ( eachCaption = va_arg( argumentList, UITextField * ) )
		{
			CGFloat currentCaptionWidth = ( ( UILabel * )( eachCaption.leftView ) ).frame.size.width;
			
			if ( currentCaptionWidth > largestWidth  )
			{
				largestWidth = currentCaptionWidth;
			}
		}
		
		va_end( argumentList );
		
		CGRect frame = firstCaption.leftView.frame;
		firstCaption.leftView.frame = CGRectMake( frame.origin.x, frame.origin.y, largestWidth, frame.size.height );
		
		va_start( argumentList, firstCaption );
		
		while ( eachCaption = va_arg( argumentList, UITextField * ) )
		{
			CGRect frame = eachCaption.leftView.frame;
			eachCaption.leftView.frame = CGRectMake( frame.origin.x, frame.origin.y, largestWidth, frame.size.height );
		}
		
		va_end( argumentList );
	}
}

@end