//
//  SevenFormView.m
//  Strive
//
//  Created by Joseph Neuman on 9/4/13.
//  Copyright (c) 2013 Joseph Neuman. All rights reserved.
//

#import "SevenFormView.h"
#import "UIView+FindFirstResponder.h"
#import "UIView+AlterFrame.h"

@interface SevenFormView ()

@end

@implementation SevenFormView

@synthesize arrayOfObjectsToUse;
@synthesize arrayOfPlacedFields;


UIColor *textColor;
UIColor *dividerColor;

// header vars
NSString *headerFontName = @"Helvetica-Light";
float headerFontSize = 23.0;

// field vars
NSString *fieldFontName = @"Helvetica-Light";
float fieldFontSize = 18.0;

#pragma mark - create form

- (SevenObject*)getSevenObjectWithKey:(NSString*)key {
    for (SevenTextField *theField in arrayOfPlacedFields) {
        if ([[[theField sevenObject] key] isEqualToString:key]) {
            return [theField sevenObject];
        }
    }
    return nil;
}

- (void)createForm {
    // for storing origin throughout the creation process
    int originY = 0, tagField = 1;
    
    for (SevenObject *theSevenObject in arrayOfObjectsToUse) {
        if ([theSevenObject isHeader]) {
            // addition space for new header
            if (originY == 0)
                originY += 10;
            else
                originY += 30;
            
            UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake(15, originY, 293, 31)];;
            [labelHeader setText:[theSevenObject title]];
            [labelHeader setFont:[UIFont fontWithName:headerFontName size:headerFontSize]];
            [labelHeader setBackgroundColor:[UIColor clearColor]];
            [labelHeader setTextColor:textColor];
            [self addSubview:labelHeader];
            
            originY += 39;
            
            // divider line
            [self addSubview:[self createDividerViewWith:originY]];
            
            originY += 9;
        } else if ([theSevenObject isDatePicker]) {
            // field
            SevenTextField *field = [[SevenTextField alloc] initWithFrame:CGRectMake(14, originY, 293, 30)];
            [field setAutoresizingMask:(UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth)];
            [field setDelegate:self];
            [field setBorderStyle:UITextBorderStyleNone];
            [field setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
            [field setTag:tagField];
            [field setFont:[UIFont fontWithName:fieldFontName size:fieldFontSize]];
            [field setTextColor:textColor];
            [field setReturnKeyType:UIReturnKeyNext];
            
            if ([theSevenObject dateValue] != nil) {
                [field setText:[self stringAsShortDate:[theSevenObject dateValue]]];
            }
            [field setPlaceholder:[theSevenObject placeholder]];
            
            // setup date picker
            CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
            UIDatePicker *pickerView = [[UIDatePicker alloc] initWithFrame:pickerFrame];
            if ([theSevenObject dateValue] != nil) {
                [pickerView setDate:[theSevenObject dateValue]];
            }
            [pickerView setDatePickerMode:UIDatePickerModeDate];
            [pickerView setMaximumDate:[theSevenObject maximumDate]];
            //pickerView.dataSource = self;
            //pickerView.delegate = self;
            [pickerView addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
            [pickerView setTag:[field tag]];
            [field setInputView:pickerView];
            
            [field setSevenObject:theSevenObject];
            [arrayOfPlacedFields addObject:field];
            [self addSubview:field];
            
            originY += field.frame.size.height+4;
            
            // divider line
            [self addSubview:[self createDividerViewWith:originY]];
            
            tagField += 1;
            originY += 9;
        } else if ([theSevenObject isPicker]) {
            // field
            SevenTextField *field = [[SevenTextField alloc] initWithFrame:CGRectMake(14, originY, 293, 30)];
            [field setAutoresizingMask:(UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth)];
            [field setDelegate:self];
            [field setBorderStyle:UITextBorderStyleNone];
            [field setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
            [field setTag:tagField];
            [field setFont:[UIFont fontWithName:fieldFontName size:fieldFontSize]];
            [field setTextColor:textColor];
            [field setReturnKeyType:UIReturnKeyNext];
            
            [field setText:[theSevenObject value]];
            [field setPlaceholder:[theSevenObject placeholder]];
            
            // setup date picker
            CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
            UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
            pickerView.dataSource = self;
            pickerView.delegate = self;
            [pickerView setShowsSelectionIndicator:YES];
            [pickerView setTag:[field tag]];
            [field setInputView:pickerView];
            
            [field setSevenObject:theSevenObject];
            [arrayOfPlacedFields addObject:field];
            [self addSubview:field];
            
            originY += field.frame.size.height+4;
            
            // divider line
            [self addSubview:[self createDividerViewWith:originY]];
            
            tagField += 1;
            originY += 9;
        } else {
            // field
            SevenTextField *field = [[SevenTextField alloc] initWithFrame:CGRectMake(14, originY, 293, 30)];
            [field setAutoresizingMask:(UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth)];
            [field setDelegate:self];
            [field setBorderStyle:UITextBorderStyleNone];
            [field setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
            [field setTag:tagField];
            [field setFont:[UIFont fontWithName:fieldFontName size:fieldFontSize]];
            [field setTextColor:textColor];
            [field setReturnKeyType:UIReturnKeyNext];
            
            [field setText:[theSevenObject value]];
            [field setPlaceholder:[theSevenObject placeholder]];
            
            [field setKeyboardType:[theSevenObject keyboardType]];
            [field setAutocapitalizationType:[theSevenObject autocapitalizationType]];
            [field setAutocorrectionType:[theSevenObject autocorrectionType]];
            [field setSecureTextEntry:[theSevenObject secure]];
            
            [field setSevenObject:theSevenObject];
            [arrayOfPlacedFields addObject:field];
            [self addSubview:field];
            
            originY += field.frame.size.height+4;
            
            // divider line
            [self addSubview:[self createDividerViewWith:originY]];
            
            tagField += 1;
            originY += 9;
        }
    }
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidBeginEditing:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [[arrayOfPlacedFields lastObject] setReturnKeyType:UIReturnKeyDone];
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.subviews)
        contentRect = CGRectUnion(contentRect, view.frame);
    [self setFrame:contentRect];
    
    [self setupAfterFieldsAreCreated];
}

#pragma mark - keyboard stuff

- (IBAction)actionKeyboardButton:(UIBarButtonItem*)sender {
    /*NSMutableArray *arrayOfTextFields = [NSMutableArray new];
    for (UIView *theView in self.subviews) {
        if ([theView isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = (UITextField*)theView;
            [arrayOfTextFields addObject:theTextField];
        }
    }
    
    NSSortDescriptor *ascendingSort = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
    //NSSortDescriptor *descendingSort = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:NO];
    arrayOfTextFields = [[arrayOfTextFields sortedArrayUsingDescriptors:[NSArray arrayWithObject:ascendingSort]] mutableCopy];
     */
    
    UIView *currentFirstResponder = [self findFirstResponder];
    UIView* nextResponder;
    
    if ([[sender title] isEqualToString:@"Previous"]) {
        NSInteger nextTag = currentFirstResponder.tag - 1;
        // Try to find next responder
        nextResponder = [currentFirstResponder.superview viewWithTag:nextTag];
        if (nextResponder) {
            // Found next responder, so set it.
            [nextResponder becomeFirstResponder];
        }
    } else if ([[sender title] isEqualToString:@"Next"]) {
        NSInteger nextTag = currentFirstResponder.tag + 1;
        // Try to find next responder
        nextResponder = [currentFirstResponder.superview viewWithTag:nextTag];
        if (nextResponder) {
            // Found next responder, so set it.
            [nextResponder becomeFirstResponder];
        }
    } else { // done
        [currentFirstResponder resignFirstResponder];
    }
}

-(void)setupAfterFieldsAreCreated {
    // keyboard toolbar
    UIToolbar *keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 44)];
    [keyboardToolbar setTintColor:[UIColor blackColor]];
    
    UIBarButtonItem *previousButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self action:@selector(actionKeyboardButton:)];
    [previousButton setWidth:70];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(actionKeyboardButton:)];
    [nextButton setWidth:70];
    UIBarButtonItem *extraSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(actionKeyboardButton:)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(actionKeyboardButton:)];
    
    [keyboardToolbar setItems:[NSArray arrayWithObjects:previousButton, nextButton, extraSpace, doneButton, nil]];
  
    for (UIView *theView in self.subviews) {
        if ([theView isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = (UITextField*)theView;
            [theTextField setInputAccessoryView:keyboardToolbar];
        }
    }
}

#pragma mark - UIDatePicker stuff

-(void)datePickerValueChanged:(id)sender
{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    
    SevenTextField *field = [arrayOfPlacedFields objectAtIndex:[sender tag]-1];
    [field setText:[self stringAsShortDate:((UIDatePicker*)sender).date]];
    
    
    /* the following allows you to choose the date components
     NSCalendar *calendar = [NSCalendar currentCalendar];
     
     int hour   =    [[calendar components:NSHourCalendarUnit    fromDate:[datePicker date]] hour];
     int minute =    [[calendar components:NSMinuteCalendarUnit  fromDate:[datePicker date]] minute];
     
     int year   =    [[calendar components:NSYearCalendarUnit    fromDate:[datePicker date]] year];
     int month  =    [[calendar components:NSMonthCalendarUnit   fromDate:[datePicker date]] month];
     int day    =    [[calendar components:NSDayCalendarUnit     fromDate:[datePicker date]] day];
     */
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [[[[arrayOfPlacedFields objectAtIndex:[pickerView tag]-1] sevenObject] items] count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [[[[[arrayOfPlacedFields objectAtIndex:[pickerView tag]-1] sevenObject] items] objectAtIndex:component] count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[[[[arrayOfPlacedFields objectAtIndex:[pickerView tag]-1] sevenObject] items] objectAtIndex:component] objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    SevenTextField *field = [arrayOfPlacedFields objectAtIndex:[pickerView tag]-1];
    [field setText:[self getPickerViewValueForSevenField:field]];
}

#pragma mark - Getting/setting value from UIPickerView

- (id)getPickerViewValueForSevenField:(SevenTextField*)theSevenField {
    
    if ([[theSevenField inputView] isKindOfClass:[UIPickerView class]]) {
        UIPickerView *pickerView = (UIPickerView*)[theSevenField inputView];
        
        NSMutableArray *componentsValues = [NSMutableArray array];
        
        for (int i = 0; i < pickerView.numberOfComponents; i++)
        {
            NSInteger rowIndex = [pickerView selectedRowInComponent:i];
            if (rowIndex >= 0) {
                [componentsValues addObject:[self pickerView:pickerView titleForRow:rowIndex forComponent:i]];
            } else {
                [componentsValues addObject:[NSNull null]];
            }
        }
        
        //NSLog(@"Picker Value: %@", [self objectFromComponentsValues:componentsValues]);
        return [self objectFromComponentsValues:componentsValues];
    }
    return nil;
}

- (void)setPickerViewValue:(id)value forSevenField:(SevenTextField*)theSevenField {
    if ([[theSevenField inputView] isKindOfClass:[UIPickerView class]]) {
        UIPickerView *pickerView = (UIPickerView*)[theSevenField inputView];
        NSArray *componentsValues = [self componentsValuesFromObject:value];
        
        for (int componentIndex = 0; componentIndex < componentsValues.count && componentIndex < pickerView.numberOfComponents; componentIndex++)
        {
            id componentValue = [componentsValues objectAtIndex:(NSUInteger) componentIndex];
            NSInteger rowIndex = [[[[theSevenField sevenObject] items] objectAtIndex:componentIndex] indexOfObject:componentValue];
            if (rowIndex != NSNotFound) {
                [pickerView selectRow:rowIndex inComponent:componentIndex animated:YES];
            }
        }
    }
}

- (id)objectFromComponentsValues:(NSArray *)componentsValues
{
    return [componentsValues componentsJoinedByString:@"/"];
}

- (NSArray *)componentsValuesFromObject:(id)object
{
    NSString *stringValue = [object isKindOfClass:[NSString class]] ? object : [object description];
    return [stringValue componentsSeparatedByString:@"/"];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField*)textField;{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (void)textFieldDidBeginEditing:(SevenTextField *)textField {
    /*if (textField == nil) {
        if ([[self findFirstResonder] isKindOfClass:[SevenTextField class]]) {
            textField = (SevenTextField*)[self findFirstResonder];
        } else {
            return;
        }
    }*/
    
    [self scrollRectToVisible:[textField frame] animated:YES];
    
    NSMutableArray *arrayOfTextFields = [NSMutableArray new];
    for (UIView *theView in self.subviews) {
        if ([theView isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = (UITextField*)theView;
            [arrayOfTextFields addObject:theTextField];
        }
    }
    
    NSSortDescriptor *ascendingSort = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
    //NSSortDescriptor *descendingSort = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:NO];
    arrayOfTextFields = [[arrayOfTextFields sortedArrayUsingDescriptors:[NSArray arrayWithObject:ascendingSort]] mutableCopy];
    
    if ([textField tag] == 1) {
        [[[(UIToolbar*)[textField inputAccessoryView] items] objectAtIndex:0] setEnabled:FALSE];
        [[[(UIToolbar*)[textField inputAccessoryView] items] objectAtIndex:1] setEnabled:TRUE];
    } else if ([textField tag] == [arrayOfTextFields count]) {
        [[[(UIToolbar*)[textField inputAccessoryView] items] objectAtIndex:0] setEnabled:TRUE];
        [[[(UIToolbar*)[textField inputAccessoryView] items] objectAtIndex:1] setEnabled:FALSE];
    } else {
        [[[(UIToolbar*)[textField inputAccessoryView] items] objectAtIndex:0] setEnabled:TRUE];
        [[[(UIToolbar*)[textField inputAccessoryView] items] objectAtIndex:1] setEnabled:TRUE];
    }
    
    // picker view stuff
    if ([[textField inputView] isKindOfClass:[UIPickerView class]]) {
        if ([textField sevenObject].value != nil) {
            [self setPickerViewValue:[textField sevenObject].value forSevenField:textField];
        }
        [[textField inputView] setFrame:CGRectMake(0, 40, self.frame.size.width, [textField inputView].frame.size.height)];
    } else if ([[textField inputView] isKindOfClass:[UIDatePicker class]]) {
        [[textField inputView] setFrame:CGRectMake(0, 40, self.frame.size.width, [textField inputView].frame.size.height)];
    }
}

- (void)textFieldDidEndEditing:(SevenTextField *)textField {
    [[textField sevenObject] setValue:[textField text]];
    if ([[textField sevenObject] isDatePicker]) {
        [[textField sevenObject] setDateValue:[(UIDatePicker*)[textField inputView] date]];
    }
}

#pragma mark - helper methods

- (UIView*)createDividerViewWith:(float)originY {
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, originY, 320, 1)];
  [view setBackgroundColor:dividerColor];
  [view setAutoresizingMask:(UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth)];
  return view;
}

- (void) resizeForKeyboard:(NSNotification*)aNotification {
  
  BOOL up = aNotification.name == UIKeyboardWillShowNotification;
  
  if (_keyboardVisible == up)
    return;
  
  _keyboardVisible = up;
  NSDictionary* userInfo = [aNotification userInfo];
  NSTimeInterval animationDuration;
  UIViewAnimationOptions animationCurve;
  CGRect keyboardEndFrame;
  [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
  [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
  [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
  
  [UIView animateWithDuration:animationDuration delay:0 options:animationCurve
                   animations:^{
                     CGRect keyboardFrame = [self convertRect:keyboardEndFrame toView:nil];
                     const UIEdgeInsets oldInset = self.contentInset;
                     self.contentInset = UIEdgeInsetsMake(oldInset.top, oldInset.left,  up ? keyboardFrame.size.height : 0, oldInset.right);
                     self.scrollIndicatorInsets = self.contentInset;
                     if (up) {
                       [[(UITextField*)[self findFirstResponder] delegate] textFieldDidBeginEditing:(UITextField*)[self findFirstResponder]];
                     }
                   }
                   completion:NULL];
}

- (void)setContentSizeOfSevenFormView {
  BOOL restoreHorizontal = NO;
  BOOL restoreVertical = NO;
  
  if ([self respondsToSelector:@selector(setShowsHorizontalScrollIndicator:)] && [self respondsToSelector:@selector(setShowsVerticalScrollIndicator:)]) {
    if ([self showsHorizontalScrollIndicator]) {
      restoreHorizontal = YES;
      [self setShowsHorizontalScrollIndicator:NO];
    }
    if ([self showsVerticalScrollIndicator]) {
      restoreVertical = YES;
      [self setShowsVerticalScrollIndicator:NO];
    }
  }
  CGRect contentRect = CGRectZero;
  for (UIView *view in self.subviews) {
    if (![view isHidden])
      contentRect = CGRectUnion(contentRect, view.frame);
  }
  if (contentRect.size.height > self.frame.size.height)
    [self setScrollEnabled:TRUE];
  else
    [self setScrollEnabled:FALSE];
  if ([self respondsToSelector:@selector(setShowsHorizontalScrollIndicator:)] && [self respondsToSelector:@selector(setShowsVerticalScrollIndicator:)]) {
    if (restoreHorizontal)
    {
      [self setShowsHorizontalScrollIndicator:YES];
    }
    if (restoreVertical) {
      [self setShowsVerticalScrollIndicator:YES];
    }
  }
  contentRect.size.height += 8;
  if (contentRect.origin.y < 0) {
    contentRect.size.height += contentRect.origin.y;
  }
  self.contentSize = contentRect.size;
  [self setCanCancelContentTouches:YES];
}

#pragma mark - dates

- (NSString*)stringAsShortDate:(NSDate*)date {
  NSDateFormatter *formatter;
  if (!formatter) {
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
  }
  
  return [formatter stringFromDate: date];
}

- (NSString *)stringAsUTCnoTime:(NSDate*)date {
  NSDateFormatter *formatter2;
  if (!formatter2) {
    formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyy'-'MM'-'dd'"];
  }
  
  return [formatter2 stringFromDate:date];
}

#pragma mark - lifecycle

- (void)initialize {
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resizeForKeyboard:) name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resizeForKeyboard:) name:UIKeyboardWillHideNotification object:nil];
  arrayOfObjectsToUse = [NSMutableArray new];
  arrayOfPlacedFields = [NSMutableArray new];
  textColor = [UIColor colorWithRed:69.0/255.0 green:71.0/255.0 blue:77.0/255.0 alpha:1];
  dividerColor = [UIColor colorWithRed:188/255.0 green:189/255.0 blue:192/255.0 alpha:1];
}

- (id)initWithCoder:(NSCoder *)aCoder {
  if(self = [super initWithCoder:aCoder]){
    [self initialize];
  }
  return self;
}

- (id)initWithFrame:(CGRect)rect {
  if(self = [super initWithFrame:rect]){
    [self initialize];
  }
  return self;
}

@end
