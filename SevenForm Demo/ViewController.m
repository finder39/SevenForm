//
//  ViewController.m
//  SevenForm Demo
//
//  Created by Joseph Neuman on 7/28/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FindFirstResponder.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sevenForm;

- (void)viewDidLoad
{
    [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  if (sevenForm.arrayOfObjectsToUse.count == 0) {    
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
    
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initHeaderWithTitle:@"Contact Information"]];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"Phone Number" key:@"phone"]];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setKeyboardType:UIKeyboardTypePhonePad];
    
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initHeaderWithTitle:@"Address"]];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"Address Line 1" key:@"address1"]];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"Address Line 2" key:@"address2"]];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"City" key:@"city"]];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initPickerFieldWithTitle:nil value:nil placeholder:@"State" items:@[@[@"",@"AK",@"AL",@"AR",@"AS",@"AZ",@"CA",@"CO",@"CT",@"DC",@"DE",@"FL",@"GA",@"GU",@"HI",@"IA",@"ID",@"IL",@"IN",@"KS",@"KY",@"LA",@"MA",@"MD",@"ME",@"MH",@"MI",@"MN",@"MO",@"MS",@"MT",@"NC",@"ND",@"NE",@"NH",@"NJ",@"NM",@"NV",@"NY",@"OH",@"OK",@"OR",@"PA",@"PR",@"PW",@"RI",@"SC",@"SD",@"TN",@"TX",@"UT",@"VA",@"VI",@"VT",@"WA",@"WI",@"WV",@"WY"]] key:@"state"]];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"Zip Code" key:@"zip"]];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setKeyboardType:UIKeyboardTypeNumberPad];
    
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initHeaderWithTitle:@"Emergency Contact"]];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"Name" key:@"emergencyName"]];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"Relation" key:@"emergencyRelationship"]];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"Phone Number" key:@"emergencyNumber"]];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setKeyboardType:UIKeyboardTypePhonePad];
    
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initHeaderWithTitle:@"School"]];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"School Attended" key:@"school"]];
    [[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initPickerFieldWithTitle:nil value:nil placeholder:@"Grade" items:@[@[@"",@"Pre-K",@"K",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"]] key:@"grade"]];
    
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initHeaderWithTitle:@"Special Considerations"]];
    [[sevenForm arrayOfObjectsToUse] addObject:[[SevenObjectClass alloc] initFieldWithTitle:nil value:nil placeholder:@"optional" key:@"specialConsiderations"]]; // TODO make this multiline
    [[[sevenForm arrayOfObjectsToUse] lastObject] setAutocapitalizationType:UITextAutocapitalizationTypeSentences];
    
    [sevenForm createForm];
    
    //NSLog(@"%f, %f, %f, %f", sevenForm.view.frame.origin.x, sevenForm.view.frame.origin.y, sevenForm.view.frame.size.width, sevenForm.view.frame.size.height);
    //NSLog(@"%f, %f, %f, %f", sevenForm.view.bounds.origin.x, sevenForm.view.bounds.origin.y, sevenForm.view.bounds.size.width, sevenForm.view.bounds.size.height);
    //NSLog(@"%f, %f, %f, %f", scrollView.frame.origin.x, scrollView.frame.origin.y, scrollView.frame.size.width, scrollView.frame.size.height);
    //NSLog(@"%f, %f, %f, %f", scrollView.bounds.origin.x, scrollView.bounds.origin.y, scrollView.bounds.size.width, scrollView.bounds.size.height);
  }
  
  [sevenForm setContentSizeOfSevenFormView];
  [sevenForm setScrollEnabled:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)actionSave:(id)sender {
  
  [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    NSMutableDictionary *toEditDict = [[NSMutableDictionary alloc] init];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"firstName"].value forKey:@"firstName"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"lastName"].value forKey:@"lastName"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"gender"].value forKey:@"gender"];
    [toEditDict setValue:[sevenForm stringAsUTCnoTime:[sevenForm getSevenObjectWithKey:@"dob"].dateValue] forKey:@"dob"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"email"].value forKey:@"email"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"phone"].value forKey:@"phone"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"emergencyName"].value forKey:@"emergencyName"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"emergencyRelationship"].value forKey:@"emergencyRelationship"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"emergencyNumber"].value forKey:@"emergencyNumber"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"specialConsiderations"].value forKey:@"specialConsiderations"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"school"].value forKey:@"schoolAttended"];
    [toEditDict setValue:[sevenForm getSevenObjectWithKey:@"grade"].value forKey:@"gradeInFall"];
    
    // address
    NSMutableDictionary *toEditAddressDict = [[NSMutableDictionary alloc] init];
    [toEditAddressDict setValue:[sevenForm getSevenObjectWithKey:@"address1"].value forKey:@"address1"];
    [toEditAddressDict setValue:[sevenForm getSevenObjectWithKey:@"address2"].value forKey:@"address2"];
    [toEditAddressDict setValue:[sevenForm getSevenObjectWithKey:@"city"].value forKey:@"city"];
    [toEditAddressDict setValue:[sevenForm getSevenObjectWithKey:@"state"].value forKey:@"state"];
    [toEditAddressDict setValue:[sevenForm getSevenObjectWithKey:@"zip"].value forKey:@"postalCode"];
    [toEditDict setValue:toEditAddressDict forKey:@"address"];
  
    NSLog(@"Dictionary from form: %@", toEditDict);
}
- (IBAction)actionLeftSideButtonPress:(id)sender {
  [[self.view findFirstResponder] resignFirstResponder];
  BOOL thingsHaveChanged = FALSE;
  for (SevenTextField *field in [sevenForm arrayOfPlacedFields]) {
    if ([[field sevenObject] valueHasChanged]) {
      //DLog(@"item that changed %@, %@, %@", [field sevenObject].key, [field sevenObject].value, [field sevenObject].originalValue);
      thingsHaveChanged = TRUE;
    }
  }
  if (thingsHaveChanged) {
    NSLog(@"Things have changed");
  } else {
    NSLog(@"Things have not changed");
  }
}

@end
