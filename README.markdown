Spot Trot Helpers
=================

Overview
--------

This repository hosts various Objective-C helper classes and categories that were created to assist in the development of [Spot Trot](http://www.spottrot.com/) iPhone applications. While many contain implementation-specific details, the general ideas and class structures are generic enough to perhaps be useful to other people.

Note: The classes provided here were created as generically as possible. However, there are some implementation-specific details included in many or all of them, most of which are dependent upon these classes being used in the context of a Spot Trot project. **In other words, it is highly unlikely that these classes can be used standalone without some modification.** I will try to point out these cases where appropriate (usually in bold). Feel free to fork this project or suggest modifications. I am always in search of ways to make my code more extensible, usable, stable, and flexible.

Currently, the following custom classes are available:

- **STPickerView**: This is a subclass of `UIPickerView` that easily allows you to create slide-up/slide-down picker views similar to those found in Mobile Safari.

Currently, the following categories are available:

- **CATransition+STAdditions**: 
- **NSArray+STAdditions**: 
- **NSBundle+STAdditions**: 
- **NSString+STAdditions**: 
- **UIActionSheet+STAdditions**: 
- **UIAlertView+STAdditions**: 
- **UITableView+STAdditions**: 
- **UITextField+STAdditions**: 
- **UIView+STAdditions**: 

STPickerView
------------

![STPickerView](http://farm3.static.flickr.com/2793/4194762407_28f9e5f9e1.jpg "STPickerView")

`STPickerView` was created because `UIPickerView` does not naturally facilitate picker views that can be easily shown (slide-up) and hidden (slide-down) without manually implementing view hiding. It also includes a button toolbar similar to how `UIPickerView` does in Mobile Safari.

`STPickerView` has a very simple implementation. Once initialized with `UIView`'s `initWithFrame:` method and assigned a delegate and data source, you just call `show` and `hide` to slide-up and slide-down the picker view, respectively. In its current implementation, you do not add your instance of `STPickerView` as a subview to any view. **Instead, `STPickerView` adds itself (hidden) to the view of the selected view controller of a tab bar controller, which is assumed to be attached to the app delegate. This is implementation specific and needs to be changed.**

Classes which make use of `STPickerView` should conform to the `STPickerViewDelegate` and `UIPickerViewDataSource` protocols. `STPickerView` will send callbacks to its delegate whenever the *Pick* or *Cancel* buttons are pressed, via `pickerView:didPickRows:` and `pickerViewDidCancel`, respectively. Pressing either button also hides the picker view. For now, `STPickerView` adds two buttons to its button toolbar: *Pick* and *Cancel*. **It is assumed that there are image assets named `picker-button-pick.png` and `picker-button-cancel.png` to be used as button graphics.**

`STPickerView` supports multi-row pickers, and `pickerView:didPickRows:` provides the delegate with an array of `NSNumber`s (as `NSInteger`s) that represent the selected rows of each component. For example, in a three-component picker view, `pickerView:didPickRows:` might provide the following array: `[ 2, 0, 5 ]`. These means that the third, first, and sixth rows were selected from components one, two, and three, respectively.

### STPickerView Methods ###

    - ( void )selectRow:( NSInteger )row inComponent:( NSInteger )component animated:( BOOL )animated;
    - ( void )pickButtonPressed;
    - ( void )cancelButtonPressed;
    - ( void )show;
    - ( void )hide;
    - ( void )animationDidStop:( NSString * )animationID finished:( NSNumber * )finished context:( void * )context;

### STPickerViewDelegate Methods ###

    - ( void )pickerView:( UIPickerView * )pickerView didPickRows:( NSArray * )rows;
    - ( void )pickerViewDidCancel:( UIPickerView * )pickerView;