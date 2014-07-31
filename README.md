SevenForm
=======

### A dynamic form system for iOS

#### Features
* Interface Builder and progmatic placement
* Creation from array
* Automatic keyboard management!!!
	* Automatic scrollview content inset adjustment
	* Automatic movement of current text field into view
* Simple function to determine if any field has a changed value (great for using with the back button)
* Different field entry types
	* Any keyboard
	* UIPickerView
	* UIDatePickerView
* Easy navigation for user with previous/next/done buttons

#### Goals
* Support iPad
* Support rotation
* Conversion to Swift at some point
* Hopefully bring all helper files internal to main files

#### Form creation example
SevenForm can be initiated in the Interface Builder or via code.

##### Interface Builder
Add a UIScrollView in Interface Builder and change the class to SevenForm.

ViewController.h
```objc
@property (nonatomic, weak) IBOutlet SevenFormView *sevenForm;
```
ViewController.m
```objc
sevenForm = [SevenFormViewController new];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initHeaderWithTitle:@"Personal Information"]];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initFieldWithTitle:nil value:nil placeholder:@"First Name" key:@"firstName"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initFieldWithTitle:nil value:nil placeholder:@"Last Name" key:@"lastName"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initDateFieldWithTitle:nil dateValue:nil placeholder:@"Date of Birth" key:@"dob"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setMaximumDate:[NSDate date]];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initPickerFieldWithTitle:nil value:nil placeholder:@"Gender" items:@[@[@"", @"F", @"M"]] key:@"gender"]];

[sevenForm createForm];
```
##### Code
```objc

SevenForm *sevenForm = [SevenFormViewController new];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initHeaderWithTitle:@"Personal Information"]];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initFieldWithTitle:nil value:nil placeholder:@"First Name" key:@"firstName"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initFieldWithTitle:nil value:nil placeholder:@"Last Name" key:@"lastName"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initDateFieldWithTitle:nil dateValue:nil placeholder:@"Date of Birth" key:@"dob"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setMaximumDate:[NSDate date]];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObject alloc] initPickerFieldWithTitle:nil value:nil placeholder:@"Gender" items:@[@[@"", @"F", @"M"]] key:@"gender"]];

[sevenForm createForm];
```
