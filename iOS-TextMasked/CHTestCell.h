//
//  CHTestCell.h
//  iOS-TextMasked
//
//  Created by colin on 16/7/4.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const CHTestCellID = @"CHTestCellID";

@interface CHTestCell : UITableViewCell

@end



@interface CHTestCell (ConfigureCell)

- (void)configureWithLeftTitle:(NSString *)leftTitle leftMaskRange:(NSRange)leftRange rightTitle:(NSString *)rightTitle rightMaskRange:(NSRange)rightRange;

@end



@interface NSAttributedString (AdjustTestTitle)

+ (NSAttributedString *)attributedTitleWithString:(NSString *)string maskRange:(NSRange)maskRange;

@end