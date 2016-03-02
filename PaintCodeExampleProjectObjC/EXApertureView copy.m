//
//  EXApertureView.m
//  PaintCodeExampleProject
//
//  Created on 19.6.2015.
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import "EXApertureView.h"
#import "StyleKit.h"

#import <QuartzCore/QuartzCore.h>

 NSString* const EX_APERTURE_ANIMATION = @"EX_APERTURE_ANIMATION";


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


- (id<CAAction>)actionForKey:(NSString *)event
{
	
	if([event isEqualToString: @"apertureValue"])
	{
		
		CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath: event];
		theAnimation.fromValue = [[self presentationLayer] valueForKey: event];
			return theAnimation;
	}
	
	return [super actionForKey:event];
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

- (void)animateTo:(CGFloat)toValue
{

	/*
	//Implicit animation
	[CATransaction setAnimationDuration: 1.0];
	[CATransaction setAnimationTimingFunction: [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut]];
	((EXApertureLayer *)self.layer).apertureValue = toValue;
	*/
	
	
	//Explicit animation
	CABasicAnimation* theAnimation = [CABasicAnimation animationWithKeyPath: @"apertureValue"];
	theAnimation.delegate = self;
	theAnimation.duration = 1;
	theAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
	theAnimation.fillMode = kCAFillModeBoth;
	theAnimation.removedOnCompletion = NO;
	theAnimation.fromValue = @(((EXApertureLayer *)self.layer.presentationLayer).apertureValue);
	theAnimation.toValue = @(toValue);
	[theAnimation setValue: @(YES) forKey: EX_APERTURE_ANIMATION];
	[self.layer addAnimation:theAnimation forKey: EX_APERTURE_ANIMATION];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	if (flag)
	{
		if ([anim valueForKey: EX_APERTURE_ANIMATION] != nil)
		{
			((EXApertureLayer *)self.layer).apertureValue = ((EXApertureLayer *)self.layer.presentationLayer).apertureValue;
			[self.layer removeAnimationForKey: EX_APERTURE_ANIMATION];
		}
	}
}


- (void)drawLayer:(CALayer *)layer inContext: (CGContextRef)ctx
{	
	UIGraphicsPushContext(ctx);
		[StyleKit drawApertureWithApertureValue: ((EXApertureLayer*)layer).apertureValue];
	UIGraphicsPopContext();
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event
{
	[self setOpen: !self.open];
}

@end
