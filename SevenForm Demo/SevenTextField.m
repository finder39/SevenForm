//
//  SevenTextField.m
//  Strive
//
//  Created by Joseph Neuman on 9/4/13.
//  Copyright (c) 2013 Joseph Neuman. All rights reserved.
//

#import "SevenTextField.h"

@implementation SevenTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// not doing for now as it doesn't show at all which field you are editing
/*- (CGRect)caretRectForPosition:(UITextPosition *)position {
    if ([self.sevenObject isPicker] || [self.sevenObject isDatePicker]) {
        return CGRectZero;
    } else {
        return [super caretRectForPosition:position];
    }
}*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
