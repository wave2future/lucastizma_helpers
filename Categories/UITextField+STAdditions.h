//
//  UITextField+STAdditions.h
//
//  Created by Michael Potter on 8/14/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField ( STAdditions )

- ( void )setCaption:( NSString * )caption;
+ ( void )padCaptions:( UITextField * )firstCaption, ...;

@end