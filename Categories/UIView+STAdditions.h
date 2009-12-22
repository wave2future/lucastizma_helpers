//
//  UIView+STAdditions.h
//
//  Created by Michael Potter on 8/18/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView ( STAdditions )

- ( void )setFrameX:( CGFloat )x;
- ( void )setFrameY:( CGFloat )y;
- ( void )setFrameWidth:( CGFloat )width;
- ( void )setFrameHeight:( CGFloat )height;
- ( void )shiftFrameX:( CGFloat )x;
- ( void )shiftFrameY:( CGFloat )y;
- ( void )shiftFrameWidth:( CGFloat )width;
- ( void )shiftFrameHeight:( CGFloat )height;
- ( void )setFrameX:( CGFloat )x animatedForDuration:( NSTimeInterval )duration;
- ( void )setFrameY:( CGFloat )y animatedForDuration:( NSTimeInterval )duration;
- ( void )setFrameWidth:( CGFloat )width animatedForDuration:( NSTimeInterval )duration;
- ( void )setFrameHeight:( CGFloat )height animatedForDuration:( NSTimeInterval )duration;
- ( void )shiftFrameX:( CGFloat )x animatedForDuration:( NSTimeInterval )duration;
- ( void )shiftFrameY:( CGFloat )y animatedForDuration:( NSTimeInterval )duration;
- ( void )shiftFrameWidth:( CGFloat )width animatedForDuration:( NSTimeInterval )duration;
- ( void )shiftFrameHeight:( CGFloat )height animatedForDuration:( NSTimeInterval )duration;
+ ( void )beginAnimations;

@end