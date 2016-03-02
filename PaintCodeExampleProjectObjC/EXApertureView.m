//
//  EXApertureView.m
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "EXApertureView.h"
#import "StyleKit.h"


@interface EXApertureLayer : CALayer
@property  CGFloat apertureValue;
@end

@implementation EXApertureLayer
@dynamic apertureValue;

- (instancetype)init
{
	if (self = [super init])
	{
		self.apertureValue = 0.0;
	}
	return self;
}

- (instancetype)initWithLayer: (id)layer
{
	if ((self = [super initWithLayer: layer]))
	{
		if ([layer isKindOfClass: EXApertureLayer.class])
		{
			self.apertureValue = ((EXApertureLayer *)layer).apertureValue;
		}
	}
	return self;
}

+ (BOOL)needsDisplayForKey: (NSString*)key
{
	if([key isEqualToString: @"apertureValue"])
		return YES;
	
	return [super needsDisplayForKey: key];
}


- (id<CAAction>)actionForKey: (NSString *)event
{

	if([event isEqualToString: @"apertureValue"])
	{

		CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath: event];
		theAnimation.fromValue = [[self presentationLayer] valueForKey: event];
		
		return theAnimation;
	}

	return [super actionForKey: event];
}

@end


@implementation EXApertureView

+ (Class)layerClass
{
	return [EXApertureLayer class];
}

- (void)awakeFromNib
{
	_open = NO;
	self.layer.contentsScale = UIScreen.mainScreen.scale;
	[self.layer setNeedsDisplay];
}

- (void)setOpen: (BOOL)open
{
	
	if (open != _open)
	{
		[self animateTo: (CGFloat)open];
	}
	
	_open = open;
}

- (void)animateTo: (CGFloat)toValue
{
	EXApertureLayer* layer = (EXApertureLayer*)self.layer;
	CAMediaTimingFunction* timing = [CAMediaTimingFunction functionWithName:  kCAMediaTimingFunctionEaseInEaseOut];
	CGFloat duration = 1.0;
	
//	Implicit animation - START
	/*
	[CATransaction setAnimationDuration: duration];
	[CATransaction setAnimationTimingFunction: timing];
	((EXApertureLayer *)self.layer).apertureValue = toValue;
	*/
	
//	Implicit animation - END
	
//	Explicit animation - START
	
	CABasicAnimation* theAnimation = [CABasicAnimation animationWithKeyPath: @"apertureValue"];
	theAnimation.additive = YES;
	theAnimation.duration = duration;
	theAnimation.fillMode = kCAFillModeBoth;
	theAnimation.timingFunction = timing;
	theAnimation.fromValue = @(layer.apertureValue - toValue);
	theAnimation.toValue = @(0);
	

	[layer addAnimation: theAnimation forKey: nil];
	
	[CATransaction begin];
	[CATransaction setDisableActions: YES];
	layer.apertureValue = toValue;
	[CATransaction commit];
	
//	Explicit animation - END
	
}

- (void)drawLayer: (CALayer *)layer inContext: (CGContextRef)ctx
{

	UIGraphicsPushContext(ctx);
	
	[StyleKit drawApertureWithApertureValue: [((EXApertureLayer*)layer) apertureValue]];
	
	UIGraphicsPopContext();
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event
{
	[self setOpen: !self.open];
}

@end

