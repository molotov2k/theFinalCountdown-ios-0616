//
//  ANVTimer.h
//  theFinalCountdown
//
//  Created by Max Tkach on 6/29/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ANVTimer;

@protocol ANVTimerDelegate <NSObject>

-(void)timeDidUpdate:(NSUInteger)time fromTimer:(ANVTimer *)timer;

@end

@interface ANVTimer : UIViewController

@property (nonatomic) NSUInteger countdownTime;

@property (nonatomic, weak) id<ANVTimerDelegate> delegate;


- (instancetype)init;

- (void)startTimer;

- (void)stopTimer;





@end
