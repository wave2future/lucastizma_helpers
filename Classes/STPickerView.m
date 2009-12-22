//
//  STPickerView.m
//
//  Created by Michael Potter on 10/29/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "STPickerView.h"
#import "STGlobalReferences.h"

@implementation STPickerView

// Public Properties

@synthesize totalContainerView;
@synthesize buttonBarContainerView;
@synthesize backgroundView;
@synthesize pickButton;
@synthesize cancelButton;
@synthesize pickerView;

// Private Properties

@synthesize delegate;
@synthesize dataSource;

static NSString * kPickerViewHideAnimationID = @"STPickerViewWillHide";

#pragma mark -
#pragma mark STPickerView Methods

- ( void )selectRow:( NSInteger )row inComponent:( NSInteger )component animated:( BOOL )animated
{
	[ self.pickerView selectRow:row inComponent:component animated:animated ];
}

- ( void )setDelegate:( id< UIPickerViewDelegate > )newDelegate
{	
	delegate = newDelegate;
	self.pickerView.delegate = newDelegate;
}

- ( void )setDataSource:( id< UIPickerViewDataSource > )newDataSource
{
	dataSource = newDataSource;
	self.pickerView.dataSource = newDataSource;
}

- ( void )pickButtonPressed
{
	if ( [ self.delegate respondsToSelector:@selector( pickerView:didPickRows: ) ] )
	{
		NSMutableArray * selectedRows = [ [ [ NSMutableArray alloc ] initWithCapacity:self.pickerView.numberOfComponents ] autorelease ];
		
		for ( NSInteger index = 0; index < self.pickerView.numberOfComponents; index++ )
		{
			[ selectedRows addObject:[ NSNumber numberWithInteger:[ self.pickerView selectedRowInComponent:index ] ] ];
		}
		
		[ self.delegate performSelector:@selector( pickerView:didPickRows: ) withObject:self.pickerView withObject:selectedRows ];
	}
	
	[ self hide ];
}

- ( void )cancelButtonPressed
{
	if ( [ self.delegate respondsToSelector:@selector( pickerViewDidCancel: ) ] )
	{
		[ self.delegate performSelector:@selector( pickerViewDidCancel: ) withObject:self.pickerView ];
	}
	
	[ self hide ];
}

- ( void )show
{	
	[ CATransition standardFadeAnimationOnLayer:STActiveNavigationController.navigationBar.layer ];
	[ CATransition standardFadeAnimationOnLayer:self.backgroundView.layer ];
	
	STActiveViewController.navigationItem.leftBarButtonItem.enabled = NO;
	STActiveViewController.navigationItem.rightBarButtonItem.enabled = NO;
	
	self.hidden = NO;
	self.backgroundView.hidden = NO;
	
	[ self.totalContainerView shiftFrameY:( -1.0 * self.totalContainerView.frame.size.height ) animatedForDuration:STAnimationTimeIntervalDefault ];
}

- ( void )hide
{	
	[ CATransition standardFadeAnimationOnLayer:STActiveNavigationController.navigationBar.layer ];
	[ CATransition standardFadeAnimationOnLayer:self.backgroundView.layer ];
	
	STActiveViewController.navigationItem.leftBarButtonItem.enabled = YES;
	STActiveViewController.navigationItem.rightBarButtonItem.enabled = YES;
	
	self.backgroundView.hidden = YES;
	
	[ UIView beginAnimations:kPickerViewHideAnimationID context:NULL ];
	[ UIView setAnimationDelegate:self ];
	[ UIView setAnimationDidStopSelector:@selector( animationDidStop:finished:context: ) ];
	[ UIView setAnimationDuration:STAnimationTimeIntervalDefault ];
	
	[ self.totalContainerView shiftFrameY:self.totalContainerView.frame.size.height ];
	
	[ UIView commitAnimations ];
}

- ( void )animationDidStop:( NSString * )animationID finished:( NSNumber * )finished context:( void * )context
{
	if ( [ animationID isEqualToString:kPickerViewHideAnimationID ] )
	{
		self.hidden = YES;
	}
}

#pragma mark -
#pragma mark UIView Methods

- ( id )initWithFrame:( CGRect )aRect
{	
	self = [ super initWithFrame:aRect ];
	
	if ( self != nil )
	{
		pickerView = [ [ UIPickerView alloc ] init ];
		self.pickerView.showsSelectionIndicator = YES;
		[ self.pickerView setFrameY:44.0 ];
		
		totalContainerView = [ [ UIView alloc ] initWithFrame:CGRectMake( 0.0, aRect.size.height, 320.0, 260.0 ) ];
		
		buttonBarContainerView = [ [ UIView alloc ] initWithFrame:CGRectMake( 0.0, 0.0, 320.0, 44.0 ) ];
		UIImageView * backgroundImage = [ [ [ UIImageView alloc ] initWithImage:[ UIImage imageNamed:@"picker-background.png" ] ] autorelease ];
		[ self.buttonBarContainerView addSubview:backgroundImage ];
		
		pickButton = [ UIButton buttonWithType:UIButtonTypeCustom ];
		[ self.pickButton addTarget:self action:@selector( pickButtonPressed ) forControlEvents:UIControlEventTouchUpInside ];
		[ self.pickButton setImage:[ UIImage imageNamed:@"picker-button-pick.png" ] forState:UIControlStateNormal ];
		self.pickButton.frame = CGRectMake( 214.0, 3.0, 105.0, 37.0 );
		
		cancelButton = [ UIButton buttonWithType:UIButtonTypeCustom ];
		[ self.cancelButton addTarget:self action:@selector( cancelButtonPressed ) forControlEvents:UIControlEventTouchUpInside ];
		[ self.cancelButton setImage:[ UIImage imageNamed:@"picker-button-cancel.png" ] forState:UIControlStateNormal ];
		[ self.cancelButton sizeToFit ];
		self.cancelButton.frame = CGRectMake( 5.0, 3.0, 105.0, 37.0 );
		
		[ self.buttonBarContainerView addSubview:self.pickButton ];
		[ self.buttonBarContainerView addSubview:self.cancelButton ];
		
		[ self.totalContainerView addSubview:self.buttonBarContainerView ];
		[ self.totalContainerView addSubview:self.pickerView ];
		
		backgroundView = [ [ UIView alloc ] initWithFrame:CGRectMake( 0.0, 0.0, 320.0, 108.0 ) ];
		self.backgroundView.backgroundColor = [ UIColor blackColor ];
		self.backgroundView.alpha = 0.8;
		self.backgroundView.hidden = YES;
		
		[ self addSubview:self.totalContainerView ];
		[ self addSubview:self.backgroundView ];
		self.hidden = YES;
		
		[ STAppDelegateTabBarController.selectedViewController.view addSubview:self ];
	}
	
	return self;
}

#pragma mark -
#pragma mark NSObject Methods

- ( id )init
{
	return [ self initWithFrame:CGRectZero ];
}

- ( void )dealloc
{
	// Public Properties
	
	[ totalContainerView release ];
	[ buttonBarContainerView release ];
	[ backgroundView release ];
	[ pickButton release ];
	[ cancelButton release ];
	[ pickerView release ];
	
	// Private Properties
	
	self.delegate = nil;
	self.dataSource = nil;
	
	[ super dealloc ];
}

@end