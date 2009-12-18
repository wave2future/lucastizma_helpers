//
//  NSString+STAdditions.h
//  SpotTrot
//
//  Created by Michael Potter on 6/6/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString ( STAdditions )

- ( NSString * )dashedString;
- ( NSString * )absolutePath;
- ( BOOL )isNotEqualToString:( NSString * )string;
- ( BOOL )isEmpty;
- ( BOOL )isNotEmpty;

@end