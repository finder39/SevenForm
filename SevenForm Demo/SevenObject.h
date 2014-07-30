//
//  SevenObject.h
//  Strive
//
//  Created by Joseph Neuman on 9/4/13.
//  Copyright (c) 2013 Joseph Neuman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SevenObject : NSObject

@property (nonatomic, assign) UIKeyboardType keyboardType;
@property (nonatomic, assign) UITextAutocapitalizationType autocapitalizationType;
@property (nonatomic, assign) UITextAutocorrectionType autocorrectionType;
@property (nonatomic, assign) BOOL secure;
@property (nonatomic, copy) NSString *key;

// header
@property (nonatomic, assign) BOOL isHeader;

// text field
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *originalValue;

// date picker
@property (nonatomic, assign) BOOL isDatePicker;
@property (nonatomic, assign) UIDatePickerMode datePickerMode;
@property (nonatomic, copy) NSDate *maximumDate;
@property (nonatomic, copy) NSDate *dateValue;
@property (nonatomic, copy) NSDate *originalDateValue;

// picker
@property (nonatomic, assign) BOOL isPicker;
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, copy) NSString *componentDelimeter;

- (BOOL)valueHasChanged;
- (void)setNewValueAsOriginal;

- (SevenObject *)initHeaderWithTitle:(NSString*)title;

- (SevenObject *)initFieldWithTitle:(NSString*)title value:(NSString *)value placeholder:(NSString*)placeholder key:(NSString*)key;

- (SevenObject *)initDateFieldWithTitle:(NSString*)title dateValue:(NSDate*)dateValue placeholder:(NSString*)placeholder key:(NSString*)key;

- (SevenObject *)initPickerFieldWithTitle:(NSString*)title value:(NSString*)value placeholder:(NSString*)placeholder items:(NSArray*)items key:(NSString*)key;

@end
