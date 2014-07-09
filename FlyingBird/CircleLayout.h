//
//  CircleLayout.h
//  FlyingBird
//
//  Created by bsauniv25 on 20/06/14.
//  Copyright (c) 2014 BSA univ 25. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;

@end
