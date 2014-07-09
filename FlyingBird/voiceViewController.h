//
//  voiceViewController.h
//  FlyingBird
//
//  Created by bsauniv25 on 27/06/14.
//  Copyright (c) 2014 BSA univ 25. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
@import AVFoundation;

@interface voiceViewController : UIViewController <AVSpeechSynthesizerDelegate, UITextFieldDelegate>

@property (nonatomic, retain) AVSpeechSynthesizer *speechSynthesizer;
@property (nonatomic, assign) NSString *input;
- (void)speakText:(NSString *)toBeSpoken;
- (void)speak:(NSString *)voice;

@end
