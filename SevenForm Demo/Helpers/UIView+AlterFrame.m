//
//  UIView+AlterFrame.m
//  Strive
//
//  Created by Joseph Neuman on 2/12/13.
//  Copyright (c) 2013 Got Apps, Inc. All rights reserved.
//

#import "UIView+AlterFrame.h"

@implementation UIView (AlterFrame)

- (void) setFrameWidth:(CGFloat)newWidth {
    CGRect f = self.frame;
    f.size.width = newWidth;
    self.frame = f;
}

- (void) setFrameHeight:(CGFloat)newHeight {
    CGRect f = self.frame;
    f.size.height = newHeight;
    self.frame = f;
}

- (void) setFrameOriginX:(CGFloat)newX {
    CGRect f = self.frame;
    f.origin.x = newX;
    self.frame = f;
}

- (void) setFrameOriginY:(CGFloat)newY {
    CGRect f = self.frame;
    f.origin.y = newY;
    self.frame = f;
}

- (UIView *)findFirstResonder {
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResonder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    } return nil;
}

@end