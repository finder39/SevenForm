//
//  Helpers.h
//  SevenForm Demo
//
//  Created by Joseph Neuman on 7/28/14.
//  Copyright (c) 2014 Joseph Neuman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helpers : NSObject {
  
}

+ (void)setContentSizeOfScrollView:(UIScrollView*)scroll;
+ (NSString*)stringAsShortDate:(NSDate*)date;
+ (NSString *)stringAsUTCnoTime:(NSDate*)date;

@end
