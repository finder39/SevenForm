//
//  SevenFormViewController.h
//  Strive
//
//  Created by Joseph Neuman on 9/4/13.
//  Copyright (c) 2013 Joseph Neuman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SevenTextField.h"
#import "SevenObjectClass.h"

@interface SevenFormViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
  
}

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *arrayOfObjectsToUse;
@property (nonatomic, strong) NSMutableArray *arrayOfPlacedFields;

- (SevenObjectClass*)getSevenObjectWithKey:(NSString*)key;
- (void)createForm;

@end
