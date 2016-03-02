//
//  EXAnimationViewController.m
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import "EXAnimationViewController.h"
#import "EXAnimationLayer.h"
#import "ArrowAnimationLayer.h"

NSString* const	EX_BASIC_ANIMATION = @"EX_BASIC_ANIMATION";

@interface EXAnimationViewController ()
@property (nonatomic, strong) ArrowAnimationLayer* animatedLayer;
@property (nonatomic, strong) NSTimer* clockTimer;
@property (nonatomic, strong) CAShapeLayer *pathLayer;

@end

@implementation EXAnimationViewController


- (void)viewWillAppear: (BOOL)animated
{
	[super viewWillAppear: animated];
	
	//Animated Button
	self.animatedLayer = ArrowAnimationLayer.layer;
	self.animatedLayer.contentsScale = UIScreen.mainScreen.scale;
//	self.animatedLayer.frame = CGRectMake((self.buttonView.frame.size.width - 100.0)/2.0, (self.buttonView.frame.size.height - 100.0)/2.0, 100.0, 100.0);
    self.animatedLayer.frame = self.buttonView.bounds;
    self.animatedLayer.position = CGPointMake(CGRectGetWidth(self.buttonView.bounds)/2, CGRectGetHeight(self.buttonView.bounds)/2);
	[self.animatedLayer setValue: @(false) forKey: @"state"];
    
    CGRect ovalFrame = self.buttonView.layer.bounds;
    //// Oval Drawing
    CGRect ovalRect = CGRectMake(CGRectGetMinX(ovalFrame), CGRectGetMinY(ovalFrame) + 1, 64, 64);
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: -90 * M_PI/180 endAngle: 270 * M_PI/180 clockwise: YES];
    
    //// Bezier Drawing
    //// Subframes
    CGRect arrowFrame = CGRectMake(CGRectGetMinX(ovalFrame) + 13, CGRectGetMinY(ovalFrame) + 21, 36, 22);
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(arrowFrame) + 0.5, CGRectGetMinY(arrowFrame) + 7.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(ovalFrame) + 26.5, CGRectGetMinY(ovalFrame) + 43.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(arrowFrame) + 35.5, CGRectGetMinY(arrowFrame) + 0.5)];
    
    [ovalPath appendPath:bezierPath];
    
    self.pathLayer = [CAShapeLayer layer];
    self.pathLayer.frame = self.buttonView.layer.bounds;

    self.pathLayer.path = ovalPath.CGPath;
    self.pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    self.pathLayer.fillColor = nil;
    self.pathLayer.lineWidth = 2.0f;
    
	[self.buttonView.layer addSublayer: self.pathLayer];
	
	//Animated Clock
	[self updateClock: nil];
	self.clockTimer = [NSTimer scheduledTimerWithTimeInterval: 0.5
													   target: self
													 selector: @selector(updateClock:)
													 userInfo: nil
													  repeats: YES];

}

- (void)viewDidDisappear: (BOOL)animated
{
	[super viewDidDisappear: animated];
	[_clockTimer invalidate];
	_clockTimer = nil;
}


- (IBAction)animateButton: (UIView *)sender
{

	BOOL layerState = ![[self.animatedLayer valueForKey: @"state"] boolValue];
	
	CGFloat duration = 1.0;
	CAMediaTimingFunction* timing = [CAMediaTimingFunction functionWithName:  kCAMediaTimingFunctionEaseOut];
//	CGColorRef color = layerState ?  UIColor.redColor.CGColor : UIColor.whiteColor.CGColor;
//	CGFloat width = (layerState ? 15.0 : 5.0);
//	CGFloat radius = (layerState ? 25.0 : 5.0);
	
	
//	Implicit animation - START
	
//	[CATransaction begin];
//	[CATransaction setAnimationDuration: duration];
//	[CATransaction setAnimationTimingFunction: timing];
//	self.animatedLayer.color = color;
//	self.animatedLayer.width = width;
//	self.animatedLayer.radius = radius;
//	[CATransaction commit];
	
//	Implicit animation - END


	
//	Explicit animation - START
//  Please, uncomment animationDidStop: too.
	
//	CABasicAnimation *animationColor = [CABasicAnimation animationWithKeyPath: @"color"];
//	animationColor.fromValue = (__bridge id)((EXAnimationLayer*)self.animatedLayer.presentationLayer).color;
//	animationColor.toValue = (__bridge id)color;
//	
//	CABasicAnimation *animationRadius = [CABasicAnimation animationWithKeyPath: @"radius"];
//	animationRadius.fromValue = @(((EXAnimationLayer*)self.animatedLayer.presentationLayer).radius);
//	animationRadius.toValue = @(radius);
//	
//	CABasicAnimation *animationWidth = [CABasicAnimation animationWithKeyPath: @"width"];
//	animationWidth.fromValue = @(((EXAnimationLayer*)self.animatedLayer.presentationLayer).width);
//	animationWidth.toValue = @(width);
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.5;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.timingFunction = timing;
    [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
	
//	CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
////	animationGroup.animations = @[animationColor, animationRadius, animationWidth];
//    
//	animationGroup.timingFunction = timing;
//	animationGroup.fillMode = kCAFillModeBoth;
//	animationGroup.removedOnCompletion = NO;
//	animationGroup.duration = duration;
//	animationGroup.delegate = self;
//	[animationGroup setValue: @(YES) forKey: @"EX_BASIC_ANIMATION"];
//
//	[self.animatedLayer addAnimation: animationGroup forKey: EX_BASIC_ANIMATION];
	
//	Explicit animation - END
	
	
	//KVC helps us to keep the state of the layer:
	[self.animatedLayer setValue: @(layerState) forKey: @"state"];
}

//Uncomment animationDidStop: method for "Explicit Animation" only
//To prevent layer from continuous drawing at the end of the animation,
//we will set the model values and remove the animation completely

//- (void)animationDidStop: (CAAnimation *)anim finished: (BOOL)flag
//{
//	if (flag)
//	{
//		if ([anim valueForKey: EX_BASIC_ANIMATION] != nil)
//		{
//			self.animatedLayer.color = ((EXAnimationLayer*)self.animatedLayer.presentationLayer).color;
//			self.animatedLayer.width = ((EXAnimationLayer*)self.animatedLayer.presentationLayer).width;
//			self.animatedLayer.radius = ((EXAnimationLayer*)self.animatedLayer.presentationLayer).radius;
//			[self.animatedLayer removeAnimationForKey: EX_BASIC_ANIMATION];
//
//		}
//	}
//	
//}


- (void)updateClock: (NSTimer *)timer
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *today = [calendar components: NSCalendarUnitHour + NSCalendarUnitMinute + NSCalendarUnitSecond  fromDate: [NSDate date]];
	
	
	for (EXClockView* clockView in self.clockViews)
	{
		clockView.hours = today.hour;
		clockView.minutes = today.minute;
		clockView.seconds = today.second;
		
		[clockView setNeedsDisplay];
	}
}


@end
