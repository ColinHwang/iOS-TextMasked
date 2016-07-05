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

+ (NSAttributedString *)attributedStringWithString:(NSString *)string textColor:(UIColor *)color font:(UIFont *)font maskRange:(NSRange)maskRange
{
    return [NSAttributedString attributedStringWithString:string attributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color} maskRange:maskRange maskAttributes:@{NSForegroundColorAttributeName:[UIColor clearColor]}];
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string attributes:(NSDictionary<NSString *, id> *)attrs maskRange:(NSRange)maskRange maskAttributes:(NSDictionary<NSString *, id> *)maskAttrs
{    
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
