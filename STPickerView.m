//
//  STPickerView.m
//
//  Created by Michael Potter on 10/29/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import "STPickerView.h"

@implementation STPickerView

// Public Properties

@synthesize totalContainerView;
@synthesize buttonBarContainerView;
@synthesize pickButton;
@synthesize cancelButton;
@synthesize pickerView;

// Private Properties

@synthesize delegate;
@synthesize dataSource;

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
	UINavigationController * selectedNavigationController = ( UINavigationController * )STAppDelegateTabBarController.selectedViewController;
	
	[ CATransition standardFadeAnimationOnLayer:selectedNavigationController.navigationBar.layer ];
	
	selectedNavigationController.visibleViewController.navigationItem.leftBarButtonItem.enabled = NO;
	selectedNavigationController.visibleViewController.navigationItem.rightBarButtonItem.enabled = NO;
	
	self.hidden = NO;
	
	[ self.totalContainerView shiftFrameY:-260.0 animated:YES duration:STAnimationTimeIntervalDefault ];
}

- ( void )hide
{
	UINavigationController * selectedNavigationController = ( UINavigationController * )STAppDelegateTabBarController.selectedViewController;
	
	[ CATransition standardFadeAnimationOnLayer:selectedNavigationController.navigationBar.layer ];
	
	selectedNavigationController.visibleViewController.navigationItem.leftBarButtonItem.enabled = YES;
	selectedNavigationController.visibleViewController.navigationItem.rightBarButtonItem.enabled = YES;
	
	[ UIView beginAnimations:@"STPickerViewWillHide" context:NULL ];
	[ UIView setAnimationDelegate:self ];
	[ UIView setAnimationDidStopSelector:@selector( animationDidStop:finished:context: ) ];
	[ UIView setAnimationDuration:STAnimationTimeIntervalDefault ];
	
	[ self.totalContainerView shiftFrameY:260.0 animated:NO duration:0 ];
	
	[ UIView commitAnimations ];
}

- ( void )animationDidStop:( NSString * )animationID finished:( NSNumber * )finished context:( void * )context
{
	if ( [ animationID isEqualToString:@"STPickerViewWillHide" ] )
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
		[ self.pickerView setFrameY:44.0 animated:NO duration:0.0 ];
		
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
		
		[ self addSubview:self.totalContainerView ];
		
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
	[ pickButton release ];
	[ cancelButton release ];
	[ pickerView release ];
	
	// Private Properties
	
	self.delegate = nil;
	self.dataSource = nil;
	
	[ super dealloc ];
}

@end