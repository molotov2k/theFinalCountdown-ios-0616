//
//  ANVTimer.m
//  theFinalCountdown
//
//  Created by Max Tkach on 6/29/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "ANVTimer.h"

@interface ANVTimer()

@property (strong, nonatomic) NSTimer *timer;

@end


@implementation ANVTimer

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _countdownTime = 0;
    }
    
    return self;
}

- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

- (void)stopTimer {
    [self.timer invalidate];
}

- (void) updateTime {
    NSLog(@"%lu", self.countdownTime);
    self.countdownTime -= 1;
    if (self.delegate) {
        [self.delegate timeDidUpdate:self.countdownTime fromTimer:self];
    }
    if (self.countdownTime == 0) {
        [self stopTimer];
    }
}

@end
