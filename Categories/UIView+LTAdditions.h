//
//  UIView+LTAdditions.h
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

@interface UIView ( LTAdditions )

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
- ( void )setCenter:( CGPoint )center animatedForDuration:( NSTimeInterval )duration;
- ( void )shiftFrameX:( CGFloat )x animatedForDuration:( NSTimeInterval )duration;
- ( void )shiftFrameY:( CGFloat )y animatedForDuration:( NSTimeInterval )duration;
- ( void )shiftFrameWidth:( CGFloat )width animatedForDuration:( NSTimeInterval )duration;
- ( void )shiftFrameHeight:( CGFloat )height animatedForDuration:( NSTimeInterval )duration;
+ ( void )beginAnimations;

@end