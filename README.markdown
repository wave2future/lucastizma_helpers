Spot Trot Helpers<a name=top></a>
=================

Overview
--------

This repository hosts various Objective-C helper classes and categories that were created to assist in the development of [Spot Trot](http://www.spottrot.com/) iPhone applications. While many contain implementation-specific details, the general ideas and class structures are generic enough to perhaps be useful to other people.

Note: The classes provided here were created as generically as possible. However, there are some implementation-specific details included in many or all of them, most of which are dependent upon these classes being used in the context of a Spot Trot project. **In other words, it is highly unlikely that some of these classes can be used standalone without some modification.** I will try to point out these cases where appropriate (usually in bold). Feel free to fork this project or suggest modifications as I am always in search of ways to make my code more extensible, usable, stable, and flexible.

Currently, the following custom classes are available:

- [**STPickerView**](#stpickerview): A subclass of `UIPickerView` that easily allows you to create slide-up/slide-down picker views similar to those found in Mobile Safari.

Currently, the following categories are available:

- [**CATransition+STAdditions**](#catransition+stadditions): Contains methods for setting up `CATransition` animations easily.
- [**NSArray+STAdditions**](#nsarray+stadditions): Contains methods for sorting arrays using descriptor keys, mostly for syntactical convenience.
- [**NSBundle+STAdditions**](#nsbundle+stadditions): Contains a method for checking if a resource exists in the main resource bundle, mostly for syntactical convenience.
- [**NSString+STAdditions**](#nsstring+stadditions): Contains a handful of helpful string method, mostly for syntactical convenience.
- [**UIActionSheet+STAdditions**](#uiactionsheet+stadditions): Contains a method for showing a standard "Yes"/"No" action sheet in the key window.
- [**UIAlertView+STAdditions**](#uialertview+stadditions): Contains methods for showing a standard "OK" alert view.
- [**UITableView+STAdditions**](#uitableview+stadditions): Contains methods for creating new or reusable table view cells based on either a string identifier or class.
- [**UITextField+STAdditions**](#uitextfield+stadditions): Contains methods for adding and padding text field "captions".
- [**UIView+STAdditions**](#uiview+stadditions): Contains a handful of helpful view methods to modify frames, mostly for syntactical convenience.

STPickerView<a name="stpickerview"></a>
------------
[(back to top)](#top)

![STPickerView](http://farm3.static.flickr.com/2793/4194762407_28f9e5f9e1.jpg "STPickerView")

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

*This class probably contains implementation-specific details, most (if not all) of which are indicated in ***bold*** below.*

`STPickerView` was created because `UIPickerView` does not naturally facilitate picker views that can be easily shown (slide-up) and hidden (slide-down) without manually implementing view hiding. It also includes a button toolbar similar to how `UIPickerView` does in Mobile Safari.

`STPickerView` has a very simple implementation. Once initialized with `UIView`'s `initWithFrame:` method and assigned a delegate and data source, you just call `show` and `hide` to slide-up and slide-down the picker view, respectively. In its current implementation, you do not add your instance of `STPickerView` as a subview to any view. **Instead, `STPickerView` adds itself (hidden) to the view of the selected view controller of a tab bar controller, which is assumed to be attached to the app delegate. This is implementation specific and needs to be changed.**

Classes which make use of `STPickerView` should conform to the `STPickerViewDelegate` and `UIPickerViewDataSource` protocols. `STPickerView` will send callbacks to its delegate whenever the *Pick* or *Cancel* buttons are pressed, via `pickerView:didPickRows:` and `pickerViewDidCancel`, respectively. Pressing either button also hides the picker view. For now, `STPickerView` adds two buttons to its button toolbar: *Pick* and *Cancel*. **It is assumed that there are image assets named `picker-button-pick.png` and `picker-button-cancel.png` to be used as button graphics.**

`STPickerView` supports multi-row pickers, and `pickerView:didPickRows:` provides the delegate with an array of `NSNumber`s (as `NSInteger`s) that represent the selected rows of each component. For example, in a three-component picker view, `pickerView:didPickRows:` might provide the following array: `[ 2, 0, 5 ]`. These means that the third, first, and sixth rows were selected from components one, two, and three, respectively.

CATransition+STAdditions<a name="catransition+stadditions"></a>
------------------------
[(back to top)](#top)

*This class should not contain any implementation-specific details.*

`CATransition+STAdditions` was created to allow for `CATransition`-based layer animations to be created quickly and easily. It also allows for even easier creation of "standard" animations (default duration and timing function values).

For example, compare

    CATransition * animation = [ CATransition animation ];
    animation.type = kCATransitionFade;
    animation.subtype = nil;
    animation.duration = 0.4;
    animation.timingFunction = [ CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut ];
     
    [ someView.layer addAnimation:animation forKey:nil ];

with the functionally identical yet syntactically more succinct

    [ CATransition animationWithType:kCATransitionFade subtype:nil duration:0.4
              timingFunctionWithName:kCAMediaTimingFunctionEaseInEaseOut onLayer:someView.layer ];

Also, if you find yourself typically creating the same simple animations over and over, you can use a standard animation method provided by `CATransition+STAdditions`: `[ CATransition standardFadeAnimationOnLayer:someView.layer ];` In these methods, default duration and timing functions values are used.

NSArray+STAdditions<a name="nsarray+stadditions"></a>
-------------------
[(back to top)](#top)

### NSArray+STAdditions Methods ###

    - ( NSArray * )sortedArrayWithDescriptorKey:( NSString * )key ascending:( BOOL )ascending;
    - ( NSArray * )sortedArrayWithDescriptorKeys:( NSArray * )keys ascending:( BOOL )ascending;

*This class should not contain any implementation-specific details.*

`NSArray+STAdditions` simplifies the sorting of arrays using sort descriptors.

For example, compare

    Person * firstPerson  = [ [ Person alloc ] initWithName:@"Pippi" homeTown:@"Podunk" ];
    Person * secondPerson = [ [ Person alloc ] initWithName:@"Ana" homeTown:@"Snow Man" ];
    Person * thirdPerson  = [ [ Person alloc ] initWithName:@"Ninten" homeTown:@"Podunk" ];

    NSArray * arrayToBeSorted = [ NSArray arrayWithObjects:firstPerson, secondPerson, thirdPerson, nil ];
    NSMutableArray * sortDescriptors = [ NSMutableArray arrayWithCapacity:3 ];

    [ sortDescriptors addObject:[ [ [ NSSortDescriptor alloc ] initWithKey:@"homeTown" ascending:YES ] autorelease ] ];
    [ sortDescriptors addObject:[ [ [ NSSortDescriptor alloc ] initWithKey:@"name" ascending:YES ] autorelease ] ];

    NSArray * sortedArray = [ arrayToBeSorted sortedArrayUsingDescriptors:sortDescriptors ];

with the functionally similar yet syntactically more succinct

	Person * firstPerson  = [ [ Person alloc ] initWithName:@"Pippi" homeTown:@"Podunk" ];
    Person * secondPerson = [ [ Person alloc ] initWithName:@"Ana" homeTown:@"Snow Man" ];
    Person * thirdPerson  = [ [ Person alloc ] initWithName:@"Ninten" homeTown:@"Podunk" ];

    NSArray * sortedArray = [ [ NSArray arrayWithObjects:firstPerson, secondPerson, thirdPerson, nil ]
						   sortedArrayWithDescriptorKeys:[ NSArray arrayWithObjects:@"homeTown", @"name", nil ] ascending:YES ];
						
Both code snippets result in the same sorted array (e.g., `[ "Ninten from Podunk", "Pippi from Podunk", "Ana from Snow Man" ]` ), yet the second one is shorter. Note that these convenience methods require that all sort descriptors use the same sort order, provided by the `ascending` parameter.

NSBundle+STAdditions<a name="nsbundle+stadditions"></a>
--------------------
[(back to top)](#top)

### NSBundle+STAdditions Methods ###

    - ( BOOL )resourceExistsWithFileName:( NSString * )fileName;

*This class should not contain any implementation-specific details.*

`NSBundle+STAdditions` simply provides a method to check for the existence of a file in the main resource bundle using the entire file name.

For example, compare

    NSString * fileNameExtension = [ fileName pathExtension ];
    NSString * fileNameWithoutExtension = [ fileName stringByDeletingPathExtension ];

    if ( [ [ NSBundle mainBundle ] pathForResource:fileNameWithoutExtension ofType:fileNameExtension ] != nil ) 
    {
	    // Do something...
    }

with the functionally identical yet syntactically more succinct

	if ( [ NSBundle resourceExistsWithFileName:fileName ] )
	{
		// Do something...
	}

NSString+STAdditions<a name="nsstring+stadditions"></a>
--------------------
[(back to top)](#top)

### NSString+STAdditions Methods ###

    - ( NSString * )dashedString;
    - ( BOOL )isNotEqualToString:( NSString * )string;
    - ( BOOL )isEmpty;
    - ( BOOL )isNotEmpty;

*This class should not contain any implementation-specific details.*

`NSString+STAdditions` contains a few helper methods, mostly used to clean up syntax. `dashedString` lowercases a string and replaces all spaces " " with dashes "-". `isEmpty` checks for various conditions by which an `NSString` instance is typically considered to be empty: if it equals `@""`, `@"<null>"`, or `@"(null)"`. `isNotEqualToString:` and `isNotEmpty` are the logical inverses of `isEqualToString:` and `isEmpty`, respectively.

UIActionSheet+STAdditions<a name="uiactionsheet+stadditions"></a>
-------------------------
[(back to top)](#top)

### UIActionSheet+STAdditions Methods ###

    + ( void )showYesNoActionSheetWithTitle:( NSString * )title delegate:( id )delegate;

*This class probably contains implementation-specific details, most (if not all) of which are indicated in ***bold*** below.*

`UIActionSheet+STAdditions` provides a method as a shorthand for creating a simple action sheet with a title and *Yes* and *No* buttons. **The implementation of `showYesNoActionSheetWithTitle:delegate:` is slightly implementation-specific in that it uses an action sheet style of `UIActionSheetStyleBlackTranslucent` and shows itself in the app delegate's key window.**

For example, compare

	UIActionSheet * actionSheet = [ [ [ UIActionSheet alloc ] initWithTitle:@"This is an action sheet. Pick \"Yes\" or \"No\"."
																   delegate:someInstance
														  cancelButtonTitle:@"No"
													 destructiveButtonTitle:@"Yes"
														  otherButtonTitles:nil ] autorelease ];
	
	actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
	
	[ actionSheet showInView:[ [ UIApplication sharedApplication ] keyWindow ] ];
	
with the functionally identical yet syntactically more succinct

	[ UIActionSheet showYesNoActionSheetWithTitle:@"This is an action sheet. Pick \"Yes\" or \"No\"." delegate:someInstance ];

UIAlertView+STAdditions<a name="uialertview+stadditions"></a>
-----------------------
[(back to top)](#top)

### UIAlertView+STAdditions Methods ###

    + ( void )showStandardAlertViewWithTitle:( NSString * )title message:( NSString * )message;
	+ ( void )showStandardAlertViewWithTitle:( NSString * )title message:( NSString * )message delegate:( id )delegate;
	
*This class should not contain any implementation-specific details.*

`UIAlertView+STAdditions` provides methods for easily creating standard "OK" alert views.

For example, compare

	UIAlertView * alertView = [ [ [ UIAlertView alloc ] initWithTitle:@"Alert View"
															  message:@"This is a simple alert view. Tap \"OK\"."
															 delegate:someInstance
													cancelButtonTitle:@"OK"
													otherButtonTitles:nil ] autorelease ];
	
	[ alertView show ];
	
with the functionally identical yet syntactically more succinct

	[ UIAlertView showStandardAlertViewWithTitle:@"Alert View" message:@"This is a simple alert view. Tap \"OK\"." ];

UITableView+STAdditions<a name="uitableview+stadditions"></a>
-----------------------
[(back to top)](#top)

### UITableView+STAdditions Methods ###

    - ( UITableViewCell * )createNewCellWithNibName:( NSString * )nibName;
    - ( UITableViewCell * )createNewCellWithClass:( Class )class;
    - ( UITableViewCell * )dequeueReusableCellWithIdentifier:( NSString * )identifier nibName:( NSString * )nibName;
    - ( UITableViewCell * )dequeueReusableCellWithClass:( Class )class;

*This class probably contains implementation-specific details, most (if not all) of which are indicated in ***bold*** below.*

`UITableView+STAdditions` allows you to easily create table view cells (reusable or not).

For example, compare

	static NSString * identifier = @"CustomCellViewIdentifier";
	static NSString * nibName = @"CustomCellView";
	UITableViewCell * cell = [ someTableView dequeueReusableCellWithIdentifier:identifier ];
 
	if ( cell == nil )
	{
		NSArray * nib = [ [ NSBundle mainBundle ] loadNibNamed:nibName owner:self options:nil ];
		cell = [ nib objectAtIndex:0 ];
	}
	
with the functionally similar yet syntactically more succinct

	static NSString * identifier = @"CustomCellViewIdentifier";
	static NSString * nibName = @"CustomCellView";
	UITableView * cell = [ someTableView dequeueReusableCellWithIdentifier:identifier nibName:nibName ];
	
This class also provides an even shorter table view cell creation form (again, reusable or not). **Note, however, that it assumes that you conform your custom table view cell class name, NIB name, and reuse identifier to a particular naming convention. That is, they must be something like  `CustomTableViewCell` (class name), `CustomTableViewCell` (NIB name), and `CustomTableViewCellIdentifier` (reuse identifier)**. Conforming to this naming convention allows you to do something like the following:

    CustomTableViewCell * cell = ( CustomTableViewCell * )[ someTableView dequeueReusableCellWithClass:[ CustomTableViewCell class ] ];

or

	CustomTableViewCell * cell = ( CustomTableViewCell * )[ someTableView createNewCellWithClass:[ CustomTableViewCell class ] ];

UITextField+STAdditions<a name="uitextfield+stadditions"></a>
-----------------------
[(back to top)](#top)

![UITextField+STAdditions](http://farm3.static.flickr.com/2724/4196383250_c60db92c5b_o.png "UITextField+STAdditions")

### UITextField+STAdditions Methods ###

    - ( void )setCaption:( NSString * )caption;
	+ ( void )padCaptions:( UITextField * )firstCaption, ...;
	
*This class should not contain any implementation-specific details.*

`UITextField+STAdditions` allows you to create a "caption" for a text field (see image above). It assigns a label to a text field's left view. A collection of text fields can all have their left views padded so that the widest text field caption label in the collection determines the width of all the other caption labels of the text fields in the same collection. This ensures that the entry point for the keyboard is the same for every text field.

For example,

	[ self.emailTextField setCaption:@"E-mail" ];
	[ self.userNameTextField setCaption:@"User Name" ];
	[ self.fullNameTextField setCaption:@"Full Name" ];
	[ self.passwordTextField setCaption:@"Password" ];
	[ self.confirmTextField setCaption:@"Confirm" ];

	[ UITextField padCaptions:self.emailTextField, self.userNameTextField, self.fullNameTextField,
	  self.passwordTextField, self.confirmTextField, nil ];
	
produces the result in the sample image above. Because the "User Name" text field has the widest caption, the caption's width is used to add additional spaces to the rest of the text field captions.

UIView+STAdditions<a name="uiview+stadditions"></a>
------------------
[(back to top)](#top)

### UIView+STAdditions Methods ###

    - ( void )setFrameX:( CGFloat )x animated:( BOOL )animated duration:( NSTimeInterval )duration;
    - ( void )setFrameY:( CGFloat )y animated:( BOOL )animated duration:( NSTimeInterval )duration;
    - ( void )setFrameWidth:( CGFloat )width animated:( BOOL )animated duration:( NSTimeInterval )duration;
    - ( void )setFrameHeight:( CGFloat )height animated:( BOOL )animated duration:( NSTimeInterval )duration;
    - ( void )shiftFrameX:( CGFloat )x animated:( BOOL )animated duration:( NSTimeInterval )duration;
    - ( void )shiftFrameY:( CGFloat )y animated:( BOOL )animated duration:( NSTimeInterval )duration;
    - ( void )shiftFrameWidth:( CGFloat )width animated:( BOOL )animated duration:( NSTimeInterval )duration;
    - ( void )shiftFrameHeight:( CGFloat )height animated:( BOOL )animated duration:( NSTimeInterval )duration;
    + ( void )beginAnimations;

*This class should not contain any implementation-specific details.*

`UIView+STAdditions` contains several helper methods used to more easily adjust components of a view's frame (`origin.x`, `origin.y`, `size.width`, `size.height`). There are methods to completely change the values of these components as well as methods to simply adjust the values of the components relatively. If these methods are called with the `animated:` and `duration:` selectors set to `YES` and a valid `NSTimeInterval` value, respectively, then the changes to the view will be animated using a `UIView` animation context. If the animation ID and context are not important for a particular animation (as they rarely are), you can use `beginAnimations` to avoid having to call `beginAnimations:context:`.

For example, compare

	[ UIView beginAnimations:nil context:NULL ];
	[ UIView setAnimationDuration:0.5 ];

	someView.frame = CGRectMake( ( someView.frame.origin.x + 40.0 ), someView.frame.origin.y,
							     someView.frame.size.width, someView.frame.size.height );
							
	[ UIView commitAnimations ];
							
with the functionally identical yet syntactically more succinct

	[ someView shiftFrameX:40.0 animated:YES duration:0.5 ];