//
//  UIView+AlterFrame.h
//  Strive
//
//  Created by Joseph Neuman on 2/12/13.
//  Copyright (c) 2013 Got Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AlterFrame)

- (void) setFrameWidth:(CGFloat)newWidth;
- (void) setFrameHeight:(CGFloat)newHeight;
- (void) setFrameOriginX:(CGFloat)newX;
- (void) setFrameOriginY:(CGFloat)newY;

- (UIView *)findFirstResonder;

@end