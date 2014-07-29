SevenForm
=======

#### A dynamic form system for iOS

##### Goals
* Easy navigation for the user
* Appropriately handles all iPhone screen sized, and eventually iPad
* Conversion to Swift at some point
* Hopefully bring all helper files internal to main files

##### Form creation example
```objc

SevenForm *sevenForm = [SevenFormViewController new];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initHeaderWithTitle:@"Personal Information"]];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"First Name" key:@"firstName"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"Last Name" key:@"lastName"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
[[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initDateFieldWithTitle:nil dateValue:nil placeholder:@"Date of Birth" key:@"dob"]];
[[[sevenForm arrayOfObjectsToUse] lastObject] setMaximumDate:[NSDate date]];
[[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initPickerFieldWithTitle:nil value:nil placeholder:@"Gender" items:@[@[@"", @"F", @"M"]] key:@"gender"]];

[self.scrollView addSubview:[sevenForm view]];
[sevenForm setScrollView:self.scrollView];
[sevenForm createForm];

// set appropriate content size
[Helpers setContentSizeOfScrollView:scrollView];
```
