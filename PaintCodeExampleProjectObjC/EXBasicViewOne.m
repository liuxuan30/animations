//
//  EXBasicViewOne.m
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import "EXBasicViewOne.h"
#import "StyleKit.h"

@implementation EXBasicViewOne


- (void)drawRect:(CGRect)rect
{
	
	//StyleKit Canvas Blue will be drawn with design size and position
	//[StyleKit drawBlue];
	
	//or
	
	//Calling canvas draw method of StyleKit with defined frame:
	//StyleKit Canvas Blue will be drawn with size of EXBasicView instance and at default position
	//Circle inside will be resized too. Line width of stroke is intact.
	
	[StyleKit drawBlueRectFramedWithFrame: self.bounds];
	
}


@end
