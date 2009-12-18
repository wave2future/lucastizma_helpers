//
//  UITableView+STAdditions.h
//  SpotTrot
//
//  Created by Michael Potter on 6/30/09.
//  Copyright 2009 INM United. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView ( STAdditions )

+ ( UITableViewCell * )createReferenceCellWithNibName:( NSString * )nibName;
+ ( UITableViewCell * )createReferenceCellWithClass:( Class )class;
- ( UITableViewCell * )createNewCellWithNibName:( NSString * )nibName;
- ( UITableViewCell * )createNewCellWithClass:( Class )class;
- ( UITableViewCell * )dequeueReusableCellWithIdentifier:( NSString * )identifier nibName:( NSString * )nibName referenceCell:( UITableViewCell * )referenceCell;
- ( UITableViewCell * )dequeueReusableCellWithClass:( Class )class referenceCell:( UITableViewCell * )referenceCell;

@end