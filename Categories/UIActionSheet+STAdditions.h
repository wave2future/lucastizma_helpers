//
//  UIActionSheet+STAdditions.h
//
//  Created by Michael Potter on 8/20/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet ( STAdditions )

+ ( void )showYesNoActionSheetWithTitle:( NSString * )title delegate:( id )delegate;

@end