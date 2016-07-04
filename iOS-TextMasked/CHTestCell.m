//
//  CHTestCell.m
//  iOS-TextMasked
//
//  Created by colin on 16/7/4.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHTestCell.h"
#import "NSAttributedString+TextMasked.h"

@interface CHTestCell ()

@property (nonatomic, weak) UILabel *leftLabel;
@property (nonatomic, weak) UILabel *rightLabel;

@end

@implementation CHTestCell

- (UILabel *)leftLabel
{
    if (!_leftLabel)
    {
        UILabel *leftLabel = [UILabel new];
        
        [leftLabel setBackgroundColor:[UIColor redColor]];
        
        [self.contentView addSubview:leftLabel];
        self.leftLabel = leftLabel;
    }
    return _leftLabel;
}

- (UILabel *)rightLabel
{
    if (!_rightLabel)
    {
        UILabel *rightLabel = [UILabel new];
        
        [rightLabel setBackgroundColor:[UIColor yellowColor]];
        
        [self.contentView addSubview:rightLabel];
        self.rightLabel = rightLabel;
    }
    return _rightLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.leftLabel.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2, 44);
    self.rightLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width/2, 44);
}

@end



@implementation CHTestCell (ConfigureCell)

- (void)configureWithLeftTitle:(NSString *)leftTitle leftMaskRange:(NSRange)leftRange rightTitle:(NSString *)rightTitle rightMaskRange:(NSRange)rightRange
{
    self.leftLabel.attributedText = [NSAttributedString attributedTitleWithString:leftTitle maskRange:leftRange];
    self.rightLabel.attributedText = [NSAttributedString attributedTitleWithString:rightTitle maskRange:rightRange];
}

@end



@implementation NSAttributedString (AdjustTestTitle)

+ (NSAttributedString *)attributedTitleWithString:(NSString *)string maskRange:(NSRange)maskRange
{
    return [NSAttributedString attributedStringWithString:string textColor:[UIColor blackColor] font:[UIFont fontWithName:@"Arial" size:19.f] maskRange:maskRange];
}

@end