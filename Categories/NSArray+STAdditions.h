//
//  NSArray+STAdditions.h
//  Tim McGraw
//
//  Created by Michael Potter on 9/26/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray ( STAdditions )

- ( NSArray * )sortedArrayWithDescriptorKey:( NSString * )key ascending:( BOOL )ascending;
- ( NSArray * )sortedArrayWithDescriptorKeys:( NSArray * )keys ascending:( BOOL )ascending;

@end