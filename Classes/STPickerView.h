//
//  STPickerView.h
//
//  Created by Michael Potter on 10/29/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STPickerView : UIView
{
	UIView * totalContainerView;
	UIView * buttonBarContainerView;
	UIButton * pickButton;
	UIButton * cancelButton;
	UIPickerView * pickerView;
	
	@private
	
	id < UIPickerViewDelegate > delegate;
	id < UIPickerViewDataSource > dataSource;
}

// Public Properties

@property ( nonatomic, retain ) UIView * totalContainerView;
@property ( nonatomic, retain ) UIView * buttonBarContainerView;
@property ( nonatomic, retain ) UIButton * pickButton;
@property ( nonatomic, retain ) UIButton * cancelButton;
@property ( nonatomic, retain ) UIPickerView * pickerView;

// Private Properties

@property ( nonatomic, assign ) id < UIPickerViewDelegate > delegate;
@property ( nonatomic, assign ) id < UIPickerViewDataSource > dataSource;

- ( void )selectRow:( NSInteger )row inComponent:( NSInteger )component animated:( BOOL )animated;
- ( void )pickButtonPressed;
- ( void )cancelButtonPressed;
- ( void )show;
- ( void )hide;
- ( void )animationDidStop:( NSString * )animationID finished:( NSNumber * )finished context:( void * )context;

@end

@protocol STPickerViewDelegate < UIPickerViewDelegate >

@optional

- ( void )pickerView:( UIPickerView * )pickerView didPickRows:( NSArray * )rows;
- ( void )pickerViewDidCancel:( UIPickerView * )pickerView;

@end