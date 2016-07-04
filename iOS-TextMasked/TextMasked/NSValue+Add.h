//
//  NSValue+Add.h
//  iOS-TextMasked
//
//  Created by colin on 16/7/4.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The "zero" range -- equivalent to NSMakeRange(0, 0).
 */
FOUNDATION_EXTERN const NSRange NSRangeZero;

/**
 *  Creates a new NSRange from the specified string.
 */
NS_INLINE NSRange NSMakeRangeFromString(NSString *string)
{
    return NSMakeRange(0, string.length);
}

/**
 *  Returns a Boolean value that indicates whether a specified range is contained in a given range.
 */
NS_INLINE BOOL NSRangeInRange(NSRange range1, NSRange range2)
{
    return (NSLocationInRange(range1.location, range2) && range1.length <= (range2.length - range1.location)) ? YES : NO;
}

@interface NSValue (Add)

@end
