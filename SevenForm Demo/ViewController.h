//
//  ViewController.h
//  SevenForm Demo
//
//  Created by Joseph Neuman on 7/28/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SevenFormViewController.h"

@interface ViewController : UIViewController {
  BOOL _keyboardVisible;
  BOOL popAfterSave;
}

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) SevenFormViewController *sevenForm;

- (IBAction)actionSave:(id)sender;
- (IBAction)actionLeftSideButtonPress:(id)sender;

@end
