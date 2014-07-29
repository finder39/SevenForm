//
//  Helpers.m
//  SevenForm Demo
//
//  Created by Joseph Neuman on 7/28/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers

+ (void)setContentSizeOfScrollView:(UIScrollView*)scroll {
  BOOL restoreHorizontal = NO;
  BOOL restoreVertical = NO;
  
  if ([scroll respondsToSelector:@selector(setShowsHorizontalScrollIndicator:)] && [scroll respondsToSelector:@selector(setShowsVerticalScrollIndicator:)])
  {
    if ([scroll showsHorizontalScrollIndicator])
    {
      restoreHorizontal = YES;
      [scroll setShowsHorizontalScrollIndicator:NO];
    }
    if ([scroll showsVerticalScrollIndicator])
    {
      restoreVertical = YES;
      [scroll setShowsVerticalScrollIndicator:NO];
    }
  }
  CGRect contentRect = CGRectZero;
  for (UIView *view in scroll.subviews) {
    if (![view isHidden])
      contentRect = CGRectUnion(contentRect, view.frame);
  }
  if (contentRect.size.height > scroll.frame.size.height)
    [scroll setScrollEnabled:TRUE];
  else
    [scroll setScrollEnabled:FALSE];
  if ([scroll respondsToSelector:@selector(setShowsHorizontalScrollIndicator:)] && [scroll respondsToSelector:@selector(setShowsVerticalScrollIndicator:)])
  {
    if (restoreHorizontal)
    {
      [scroll setShowsHorizontalScrollIndicator:YES];
    }
    if (restoreVertical)
    {
      [scroll setShowsVerticalScrollIndicator:YES];
    }
  }
  contentRect.size.height += 8;
  if (contentRect.origin.y < 0) {
    contentRect.size.height += contentRect.origin.y;
  }
  scroll.contentSize = contentRect.size;
  [scroll setCanCancelContentTouches:YES];
}

#pragma mark - dates

+ (NSString*)stringAsShortDate:(NSDate*)date {
  NSDateFormatter *formatter;
  if (!formatter) {
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
  }
  
  return [formatter stringFromDate: date];
}

+ (NSString *)stringAsUTCnoTime:(NSDate*)date {
  NSDateFormatter *formatter2;
  if (!formatter2) {
    formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyy'-'MM'-'dd'"];
  }
  
  return [formatter2 stringFromDate:date];
}

@end
