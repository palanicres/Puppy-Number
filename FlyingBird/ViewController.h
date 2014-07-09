//
//  ViewController.h
//  FlyingBird
//
//  Created by bsauniv25 on 20/06/14.
//  Copyright (c) 2014 BSA univ 25. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "voiceViewController.h"

@interface ViewController : UICollectionViewController
{
    int RemoveButton;
    NSUInteger randomIndex;

}
@property (nonatomic) float scaleFactor;
@property (nonatomic) float angle;
@property (strong, nonatomic) UIView *boxView;
@property (strong, nonatomic) UIImageView *animationImageView;
@property (strong, nonatomic) UIView *hideView;
@property (strong, nonatomic) AppDelegate *delObj;
@property (strong, nonatomic) voiceViewController *voiceObj;
@property (nonatomic, assign) UIButton *button;
@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) NSArray *values;
//@property (nonatomic, assign) NSUInteger randomIndex;
@end
