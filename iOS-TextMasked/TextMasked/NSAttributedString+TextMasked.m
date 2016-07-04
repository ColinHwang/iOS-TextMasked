//
//  NSAttributedString+TextMasked.m
//  iOS-TextMasked
//
//  Created by colin on 16/7/4.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSAttributedString+TextMasked.h"
#import "NSValue+Add.h"
#import <UIKit/UIKit.h>

@implementation NSAttributedString (TextMasked)

/**
 *  Returns an NSAttributedString object with initial storage for a given string, text color, font and masked range. The masked range of characters should be masked by clear color.
 *
 *  @param string    The string for the new attributed string.
 *  @param color     The text color for the new attributed string.
 *  @param font      The font for the new attributed string.
 *  @param maskRange The range of characters should be masked. The value of masked attributes is clear color.
 */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string textColor:(UIColor *)color font:(UIFont *)font maskRange:(NSRange)maskRange
{
    return [NSAttributedString attributedStringWithString:string attributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color} maskRange:maskRange maskAttributes:@{NSForegroundColorAttributeName:[UIColor clearColor]}];
}

/**
 *  Returns an NSAttributedString object with initial storage for a given string, attributes, masked range and masked attributes. The masked range of characters should be masked by the sepecial attributes.
 *
 *  @param string    The string for the new attributed string.
 *  @param attrs     The attributes for the new attributed string. For information about where to find the attribute keys you can include in this dictionary, see the overview section of this document.
 *  @param maskRange The range of characters to which the masked attributes apply.
 *  @param maskAttrs The masked attributes for the sepecial range of characters.
 */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string attributes:(NSDictionary<NSString *, id> *)attrs maskRange:(NSRange)maskRange maskAttributes:(NSDictionary<NSString *, id> *)maskAttrs
{
    if (!string||string.length <= 0) return nil;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:attrs];

    if (NSEqualRanges(maskRange, NSRangeZero)) return attributedString;
    
    NSRange stringRange = NSMakeRangeFromString(string);
    if (NSRangeInRange(maskRange, stringRange))
    {
        [attributedString addAttributes:maskAttrs range:maskRange];
    }
    
    return attributedString;
}

@end
