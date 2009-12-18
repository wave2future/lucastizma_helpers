Spot Trot Helpers
=================

Overview
--------

This repository hosts various Objective-C helper classes and categories that were created to assist in the development of [Spot Trot](http://www.spottrot.com/) iPhone applications.

Currently, the following custom classes are available:

-   **STPickerView**: This is a subclass of `UIPickerView` that easily allows you to create slide-up/slide-down picker views similar to those found in Mobile Safari.

Note: The classes provided here were created as generically as possible. However, there are likely some implementation-specific details included in many or all of them, most of which are dependent upon these classes being used in the context of a Spot Trot project. **In other words, it is highly unlikely that these classes can be used standalone without some modification.** Feel free to fork this project or suggest modifications. I am always in search of ways to make my code more extensible, usable, stable, and flexible.

STPickerView
------------

![STPickerView](http://farm3.static.flickr.com/2793/4194762407_28f9e5f9e1.jpg "STPickerView")

`STPickerView` was created because `UIPickerView` does not naturally facilitate picker views that can be easily shown (slide-up) and hidden (slide-down) without manually implementing view hiding. It also includes a button toolbar similar to how `UIPickerView` does in Mobile Safari.

### Method Signatures ###

#### STPickerView ####

    - ( void )selectRow:( NSInteger )row inComponent:( NSInteger )component animated:( BOOL )animated;
    - ( void )pickButtonPressed;
    - ( void )cancelButtonPressed;
    - ( void )show;
    - ( void )hide;
    - ( void )animationDidStop:( NSString * )animationID finished:( NSNumber * )finished context:( void * )context;

#### STPickerViewDelegate ####

    - ( void )pickerView:( UIPickerView * )pickerView didPickRows:( NSArray * )rows;
    - ( void )pickerViewDidCancel:( UIPickerView * )pickerView;