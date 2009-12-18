//
//  UITableView+STAdditions.h
//
//  Created by Michael Potter on 6/30/09.
//  Copyright 2009 INM United. All rights reserved.
//
 
#import <UIKit/UIKit.h>
 
@interface UITableView ( STAdditions )
 
- ( UITableViewCell * )createNewCellWithNibName:( NSString * )nibName;
- ( UITableViewCell * )createNewCellWithClass:( Class )class;
- ( UITableViewCell * )dequeueReusableCellWithIdentifier:( NSString * )identifier nibName:( NSString * )nibName;
- ( UITableViewCell * )dequeueReusableCellWithClass:( Class )class;
 
@end