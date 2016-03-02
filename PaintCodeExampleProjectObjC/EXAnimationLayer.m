//
//  EXAnimationLayer.m
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import "EXAnimationLayer.h"
#import "StyleKit.h"

@implementation EXAnimationLayer
@dynamic color;
@dynamic radius;
@dynamic width;

- (instancetype)init
{
	if (self = [super init])
	{
		self.color = UIColor.whiteColor.CGColor;
		self.radius = 5.0;
		self.width = 5.0;

	}
	return self;
}

- (instancetype)initWithLayer: (id)layer
{
	if ((self = [super initWithLayer: layer]))
	{
		if ([layer isKindOfClass: EXAnimationLayer.class])
		{
			self.color = ((EXAnimationLayer *)layer).color;
			self.radius = ((EXAnimationLayer *)layer).radius;
			self.width = ((EXAnimationLayer *)layer).width;


		}
	}
	return self;
}

+ (BOOL)needsDisplayForKey: (NSString*)key
{
	if([key isEqualToString: @"color"]
	   || [key isEqualToString: @"radius"]
	   || [key isEqualToString: @"width"])
		return YES;
	
	return [super needsDisplayForKey: key];
}


- (id<CAAction>)actionForKey: (NSString *)event
{
	
	if([event isEqualToString: @"color"]
	   || [event isEqualToString: @"radius"]
	   || [event isEqualToString: @"width"])
	{
		CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath: event];
		theAnimation.fromValue = [[self presentationLayer] valueForKey: event];
		return theAnimation;
	}
	return [super actionForKey: event];
}

- (void)drawInContext: (CGContextRef)ctx
{
	UIGraphicsPushContext(ctx);

	[StyleKit drawLiveButtonWithLiveButtonColor: [UIColor colorWithCGColor: self.color]
									 radius: self.radius
								strokeWidth: self.width];
	
	
	UIGraphicsPopContext();
	
}

@end
