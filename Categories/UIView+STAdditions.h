//
//  UIView+STAdditions.h
//  SpotTrot
//
//  Created by Michael Potter on 8/18/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView ( STAdditions )

- ( void )setFrameX:( CGFloat )x animated:( BOOL )animated duration:( NSTimeInterval )duration;
- ( void )setFrameY:( CGFloat )y animated:( BOOL )animated duration:( NSTimeInterval )duration;
- ( void )setFrameWidth:( CGFloat )width animated:( BOOL )animated duration:( NSTimeInterval )duration;
- ( void )setFrameHeight:( CGFloat )height animated:( BOOL )animated duration:( NSTimeInterval )duration;
- ( void )shiftFrameX:( CGFloat )x animated:( BOOL )animated duration:( NSTimeInterval )duration;
- ( void )shiftFrameY:( CGFloat )y animated:( BOOL )animated duration:( NSTimeInterval )duration;
- ( void )shiftFrameWidth:( CGFloat )width animated:( BOOL )animated duration:( NSTimeInterval )duration;
- ( void )shiftFrameHeight:( CGFloat )height animated:( BOOL )animated duration:( NSTimeInterval )duration;
+ ( void )beginAnimations;

@end