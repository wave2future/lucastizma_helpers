//
//  LTPickerView.h
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

#import <UIKit/UIKit.h>

@interface LTPickerView : UIView
{
	UIView * totalContainerView;
	UIView * buttonBarContainerView;
	UIView * backgroundView;
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
@property ( nonatomic, retain ) UIView * backgroundView;
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

@protocol LTPickerViewDelegate < UIPickerViewDelegate >

@optional

- ( void )pickerView:( UIPickerView * )pickerView didPickRows:( NSArray * )rows;
- ( void )pickerViewDidCancel:( UIPickerView * )pickerView;

@end