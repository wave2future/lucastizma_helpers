//
//  UITableView+LTAdditions.h
//
//  Copyright 2010 Michael Shannon Potter
//
//  LucasTizma
//  www.lucastizma.com
//  lucastizma@lucastizma.com (E-mail/AIM)
// 
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
// 
//      http://www.apache.org/licenses/LICENSE-2.0
// 
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
 
@interface UITableView ( LTAdditions )
 
- ( UITableViewCell * )createNewCellWithNibName:( NSString * )nibName;
- ( UITableViewCell * )createNewCellWithClass:( Class )class;
- ( UITableViewCell * )dequeueReusableCellWithIdentifier:( NSString * )identifier nibName:( NSString * )nibName;
- ( UITableViewCell * )dequeueReusableCellWithClass:( Class )class;
 
@end