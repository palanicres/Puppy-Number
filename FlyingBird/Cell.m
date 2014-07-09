//
//  cell.m
//  FlyingBird
//
//  Created by bsauniv25 on 20/06/14.
//  Copyright (c) 2014 BSA univ 25. All rights reserved.
//

#import "Cell.h"
#import <QuartzCore/QuartzCore.h>


@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 70.0;
        self.contentView.layer.borderWidth = 5.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        _label = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
        [_label setTextColor:[UIColor magentaColor]];
        [_label setBackgroundColor:[UIColor clearColor]];
        [_label setFont:[UIFont fontWithName: @"Palatino-Bold" size: 80.0f]];
        [self.contentView addSubview:_label];
    }
    return self;
}
@end
