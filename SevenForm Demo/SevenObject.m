//
//  SevenObject.m
//  Strive
//
//  Created by Joseph Neuman on 9/4/13.
//  Copyright (c) 2013 Joseph Neuman. All rights reserved.
//

#import "SevenObject.h"

@implementation SevenObject

- (BOOL)valueHasChanged {
    if (_isDatePicker) {
        if ([_dateValue isEqualToDate:_originalDateValue] || (_dateValue == nil && _originalDateValue == nil)) {
            return FALSE;
        } else {
            return TRUE;
        }
    } else {
        if ([_value isEqualToString:_originalValue] || (_value == nil && _originalValue == nil) || ([_value isEqualToString:@""] && _originalValue == nil)) {
            return FALSE;
        } else {
            return TRUE;
        }
    }
}

- (void)setNewValueAsOriginal {
    if (_isDatePicker) {
        _originalDateValue = _dateValue;
    } else {
        _originalValue = _value;
    }
}

- (id)init {
    self = [super init];
    if (self) {
        _keyboardType = UIKeyboardTypeDefault;
        _autocorrectionType = UITextAutocorrectionTypeDefault;
        _autocapitalizationType = UITextAutocapitalizationTypeNone;
        _secure = NO;
    }
    return self;
}

- (SevenObject *)initHeaderWithTitle:(NSString *)title {
    self = [self init];
    if (self) {
        _isHeader = TRUE;
        _title = title;
    }
    return self;
}

- (SevenObject *)initFieldWithTitle:(NSString*)title value:(NSString*)value placeholder:(NSString*)placeholder key:(NSString*)key {
    self = [self init];
    if (self) {
        _title = title;
        _value = value;
        _originalValue = value;
        _placeholder = placeholder;
        _key = key;
    }
    return self;
}

- (SevenObject *)initDateFieldWithTitle:(NSString*)title dateValue:(NSDate*)dateValue placeholder:(NSString*)placeholder key:(NSString*)key {
    self = [self init];
    if (self) {
        _isDatePicker = TRUE;
        _title = title;
        _dateValue = dateValue;
        _originalDateValue = dateValue;
        _placeholder = placeholder;
        _key = key;
    }
    return self;
}


- (SevenObject *)initPickerFieldWithTitle:(NSString *)title value:(NSString*)value placeholder:(NSString *)placeholder items:(NSArray *)items key:(NSString*)key {
    self = [self init];
    if (self) {
        _isPicker = TRUE;
        _title = title;
        _value = value;
        _originalValue = value;
        _placeholder = placeholder;
        _items = items;
        _key = key;
    }
    return self;
}
@end
