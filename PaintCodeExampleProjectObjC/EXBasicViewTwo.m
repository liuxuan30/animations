//
//  EXBasicViewTwo.m
//  PaintCodeExampleProjectObjC
//
//  Copyright (c) 2015 Company. All rights reserved.
//

#import "EXBasicViewTwo.h"
#import	"StyleKit.h"

@implementation EXBasicViewTwo



- (void)drawLayer: (CALayer*)layer inContext: (CGContextRef) ctx
{
	UIGraphicsPushContext(ctx);

	[StyleKit drawBlueRectFramedWithFrame: layer.bounds];
	
	UIGraphicsPopContext();
}

@end
