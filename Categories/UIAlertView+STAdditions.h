//
//  UIAlertView+STAdditions.h
//  SpotTrot
//
//  Created by Michael Potter on 8/17/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView ( STAdditions )

+ ( void )showStandardAlertViewWithTitle:( NSString * )title message:( NSString * )message;
+ ( void )showStandardAlertViewWithTitle:( NSString * )title message:( NSString * )message delegate:( id )delegate;

@end