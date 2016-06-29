//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import "ANVTimer.h"

@interface FISViewController () <ANVTimerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *startButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *pauseButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *cancelButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *resumeButtonOutlet;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerOutlet;
@property (weak, nonatomic) IBOutlet UILabel *timeOutlet;

@property (strong, nonatomic) ANVTimer *timer;
@property (strong, nonatomic) ANVTimer *timer2;
@property (strong, nonatomic) id timerObserver;

@property (strong, nonatomic) NSTimer *nstimer;

@end


@implementation FISViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetScreenState];
    
    
}


- (IBAction)startButtonAction:(id)sender {
    self.pauseButtonOutlet.enabled = true;
    self.datePickerOutlet.hidden = true;
    self.timeOutlet.hidden = false;
    self.startButtonOutlet.hidden = true;
    self.cancelButtonOutlet.hidden = false;
    self.resumeButtonOutlet.hidden = true;
    
    self.timer = [[ANVTimer alloc] init];
    self.timer2 = [[ANVTimer alloc] init];
    
    self.timer.delegate = self;
    self.timer2.delegate = self;
    
    self.timer.countdownTime = self.datePickerOutlet.countDownDuration;
    self.timer2.countdownTime = 360;
    
    [self.timer startTimer];
    [self.timer2 startTimer];
    //[self.timer addObserver:self forKeyPath:@"countdownTime" options:nil context:nil];

    
    
    
    
    
}

- (IBAction)cancelButtonAction:(id)sender {
    [self resetScreenState];
}


- (IBAction)pauseButtonAction:(id)sender {
    self.pauseButtonOutlet.hidden = true;
    self.resumeButtonOutlet.hidden = false;
    [self.timer stopTimer];
}

- (IBAction)resumeButtonAction:(id)sender {
    self.pauseButtonOutlet.hidden = false;
    self.resumeButtonOutlet.hidden = true;
    [self.timer startTimer];
}

- (void)resetScreenState {
    self.cancelButtonOutlet.hidden = true;
    self.startButtonOutlet.hidden = false;
    self.pauseButtonOutlet.enabled = false;
    self.datePickerOutlet.hidden = false;
    self.pauseButtonOutlet.hidden = false;
    self.timeOutlet.hidden = true;
    self.resumeButtonOutlet.hidden = true;
    [self.timer stopTimer];
}

- (void)updateTimeLabel:(NSUInteger)time {
    NSUInteger timeRemainig = time;
    NSUInteger hours = timeRemainig / 3600;
    NSUInteger minutes = (timeRemainig % 3600) / 60;
    NSUInteger seconds = timeRemainig % 60;
    if (hours > 0) {
        self.timeOutlet.text = [NSString stringWithFormat:@"%02lu:%02lu", hours, minutes];
    } else {
        self.timeOutlet.text = [NSString stringWithFormat:@"%02lu:%02lu", minutes, seconds];
    }

}

-(void)timeDidUpdate:(NSUInteger)time fromTimer:(ANVTimer *)timer {
    
    if ([timer isEqual:self.timer]) {
        [self updateTimeLabel:time];
    }
    if ([timer isEqual:self.timer2]) {
        NSLog(@"This is timer 2");
    }
    
}


@end
