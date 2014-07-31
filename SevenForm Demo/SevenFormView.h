//
//  SevenFormView.h
//  Strive
//
//  Created by Joseph Neuman on 9/4/13.
//  Copyright (c) 2013 Joseph Neuman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SevenTextField.h"
#import "SevenObject.h"

@interface SevenFormView : UIScrollView <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
  BOOL _keyboardVisible;
  BOOL popAfterSave;
}

@property (nonatomic, strong) NSMutableArray *arrayOfObjectsToUse;
@property (nonatomic, strong) NSMutableArray *arrayOfPlacedFields;

- (SevenObject*)getSevenObjectWithKey:(NSString*)key;
- (void)createForm;
- (BOOL)thingsHaveChanged;

#pragma mark - helper methods
- (void)setContentSizeOfSevenFormView;
- (NSString*)stringAsShortDate:(NSDate*)date;
- (NSString *)stringAsUTCnoTime:(NSDate*)date;

@end
