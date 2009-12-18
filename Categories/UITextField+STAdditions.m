//
//  UITextField+STAdditions.m
//  SpotTrot
//
//  Created by Michael Potter on 8/14/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "UITextField+STAdditions.h"
#import "STGlobalReferences.h"

@implementation UITextField ( STAdditions )

#pragma mark -
#pragma mark UITextField ( STAdditions ) Category Methods

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