//
//  PCFTitleView.m
//  TTCHackathon
//
//  Created by DX121-XL on 2014-08-18.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "PCFTitleView.h"

@implementation PCFTitleView

- (id)initWithFrame:(CGRect)frame andTitle:(NSString*)title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_ttc_logo.png"]];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [imageView setFrame: CGRectMake(0, 0, 25, 25)];
        [self addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        titleLabel.text = title;
        titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
        [titleLabel setTextColor: [UIColor whiteColor]];
        
        [titleLabel sizeToFit];
        [self addSubview:titleLabel];
        
        NSDictionary *views     = @{ @"imageView"  : imageView,
                                     @"titleLabel" : titleLabel };
        
        NSDictionary *metrics   = @{ @"width"      : @(CGRectGetWidth(self.frame) / 2) };
        
        NSArray *constraints;
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:0 metrics:nil views:views];
        [self addConstraints:constraints];
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel]|" options:0 metrics:nil views:views];
        [self addConstraints:constraints];
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[imageView]-(1)-[titleLabel(>=width)]-|" options:0 metrics:metrics views:views];
        [self addConstraints:constraints];
    }
    return self;
}

@end
