//
//  voiceViewController.m
//  FlyingBird
//
//  Created by bsauniv25 on 27/06/14.
//  Copyright (c) 2014 BSA univ 25. All rights reserved.
//

#import "voiceViewController.h"

@interface voiceViewController ()

@end

@implementation voiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Instantiate the object that will allow us to use text to speech
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)speakText:(NSString *)toBeSpoken{
    
    AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:toBeSpoken];
    utt.rate *= 0.25;
    [self.speechSynthesizer speakUtterance:utt];
    
}

- (void)speak :(NSString *)voice {
    self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    [self.speechSynthesizer setDelegate:self];
    [self speakText:voice];
}

@end
