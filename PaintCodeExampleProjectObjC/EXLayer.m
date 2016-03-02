//
//  EXLayer.m
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import "EXLayer.h"
#import "StyleKit.h"

@implementation EXLayer


- (void)drawInContext: (CGContextRef)ctx
{
	UIGraphicsPushContext(ctx);

	[StyleKit drawBlueRectFramedWithFrame: self.frame];
	
	UIGraphicsPopContext();
}

@end
