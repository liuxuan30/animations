//
//  EXClockView.m
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import "EXClockView.h"
#import "StyleKit.h"
@implementation EXClockView


- (void)drawRect: (CGRect)rect
{
	[StyleKit drawClockWithWatchColor: self.clockColor
								  hrs: self.hours
								 mins: self.minutes
								 secs: self.seconds];
}

@end
